import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class CallResult {
  const CallResult({
    required this.success,
    required this.message,
  });

  final bool success;
  final String message;
}

class CallService {
  Future<CallResult> callPrimaryContact(String contact) async {
    if (contact.isEmpty) {
      return const CallResult(
        success: false,
        message: 'Primary emergency contact is not available.',
      );
    }

    // Try direct calling first for one-tap emergency behavior on Android.
    if (!kIsWeb && Platform.isAndroid) {
      try {
        final directCalled =
            await FlutterPhoneDirectCaller.callNumber(contact) ?? false;
        if (directCalled) {
          return const CallResult(
            success: true,
            message: 'Emergency call started automatically to primary contact.',
          );
        }
      } catch (_) {
        // Fall through to dialer fallback.
      }
    }

    final telUri = Uri(scheme: 'tel', path: contact);
    final canLaunch = await canLaunchUrl(telUri);
    if (!canLaunch) {
      return const CallResult(
        success: false,
        message: 'Calling is not available on this device.',
      );
    }

    final launched = await launchUrl(
      telUri,
      mode: LaunchMode.externalApplication,
    );
    if (!launched) {
      return const CallResult(
        success: false,
        message: 'Failed to open dialer for emergency call.',
      );
    }

    return const CallResult(
      success: true,
      message: 'Emergency call initiated to primary contact.',
    );
  }
}
