import 'dart:io';
import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:telephony/telephony.dart';
import 'package:url_launcher/url_launcher.dart';

class SmsSendResult {
  const SmsSendResult({
    required this.message,
    this.sentContacts = const <String>[],
    this.failedContacts = const <String>[],
    this.openedComposer = false,
  });

  final String message;
  final List<String> sentContacts;
  final List<String> failedContacts;
  final bool openedComposer;

  bool get success => sentContacts.isNotEmpty;
}

class SmsService {
  Future<SmsSendResult> sendEmergencySms({
    required List<String> contacts,
    required String body,
    bool allowComposerFallback = true,
  }) async {
    if (contacts.isEmpty) {
      return const SmsSendResult(message: 'No emergency contacts configured.');
    }

    if (kIsWeb || !Platform.isAndroid) {
      if (!allowComposerFallback) {
        return const SmsSendResult(
          message:
              'Direct SMS auto-send is not supported on this platform in one-tap mode.',
        );
      }

      final fallbackUri = Uri(
        scheme: 'sms',
        path: contacts.first,
        queryParameters: <String, String>{'body': body},
      );
      final launched = await launchUrl(
        fallbackUri,
        mode: LaunchMode.externalApplication,
      );
      return SmsSendResult(
        message: launched
            ? 'Direct SMS is not supported on this platform. Opened messaging app as fallback.'
            : 'SMS sending is not supported on this platform.',
        openedComposer: launched,
      );
    }

    final telephony = Telephony.instance;
    final granted = await telephony.requestPhoneAndSmsPermissions ?? false;
    if (!granted) {
      return const SmsSendResult(
        message: 'SMS permission denied. Could not send emergency messages.',
      );
    }

    final sent = <String>[];
    final failed = <String>[];

    for (final contact in contacts) {
      final normalized = _normalizeContact(contact);
      if (normalized.isEmpty) {
        failed.add(contact);
        continue;
      }

      try {
        final statusCompleter = Completer<bool>();
        await telephony.sendSms(
          to: normalized,
          message: body,
          statusListener: (SendStatus status) {
            if (statusCompleter.isCompleted) {
              return;
            }

            final successStatus =
                status == SendStatus.SENT || status == SendStatus.DELIVERED;
            statusCompleter.complete(successStatus);
          },
        );

        final didSend = await statusCompleter.future.timeout(
          const Duration(seconds: 8),
          // Some devices/providers do not return delivery callbacks reliably.
          // If dispatch did not throw, treat timeout as queued/sent.
          onTimeout: () => true,
        );

        if (didSend) {
          sent.add(normalized);
        } else {
          failed.add(normalized);
        }
      } catch (_) {
        failed.add(normalized);
      }
    }

    if (sent.isEmpty) {
      if (!allowComposerFallback) {
        return SmsSendResult(
          message: 'SMS auto-send failed for all emergency contacts.',
          failedContacts: failed,
        );
      }

      final fallbackUri = Uri(
        scheme: 'sms',
        path: contacts.first,
        queryParameters: <String, String>{'body': body},
      );
      final launched = await launchUrl(
        fallbackUri,
        mode: LaunchMode.externalApplication,
      );

      return SmsSendResult(
        message: launched
            ? 'Could not auto-send SMS. Opened messaging app with emergency message.'
            : 'SMS sending failed for all emergency contacts.',
        failedContacts: failed,
        openedComposer: launched,
      );
    }

    return SmsSendResult(
      message: failed.isEmpty
          ? 'Emergency SMS sent to all contacts.'
          : 'Emergency SMS sent to ${sent.length} contact(s), failed for ${failed.length}.',
      sentContacts: sent,
      failedContacts: failed,
    );
  }

  String _normalizeContact(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return '';
    }

    // Keep only digits and a single leading plus sign.
    final keep = trimmed.replaceAll(RegExp(r'[^0-9+]'), '');
    if (keep.startsWith('+')) {
      return '+${keep.substring(1).replaceAll('+', '')}';
    }
    return keep.replaceAll('+', '');
  }
}
