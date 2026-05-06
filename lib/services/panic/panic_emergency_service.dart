import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'backend_sms_service.dart';
import 'call_service.dart';
import 'location_service.dart';
import 'sms_service.dart';

class PanicAlertResult {
  const PanicAlertResult({
    required this.success,
    required this.message,
    this.locationUrl,
  });

  final bool success;
  final String message;
  final String? locationUrl;
}

class PanicEmergencyService {
  PanicEmergencyService({
    LocationService? locationService,
    SmsService? smsService,
    BackendSmsService? backendSmsService,
    CallService? callService,
  })  : _locationService = locationService ?? LocationService(),
        _smsService = smsService ?? SmsService(),
        _backendSmsService = backendSmsService ?? BackendSmsService(),
        _callService = callService ?? CallService();

  final LocationService _locationService;
  final SmsService _smsService;
  final BackendSmsService _backendSmsService;
  final CallService _callService;

  Future<PanicAlertResult> triggerEmergencyAlert({
    required String userName,
    required String userPhone,
  }) async {
    final contacts = await _fetchEmergencyContacts();
    debugPrint('[PanicEmergency] Contacts resolved: ${contacts.join(', ')}');
    if (contacts.isEmpty) {
      return const PanicAlertResult(
        success: false,
        message: 'No emergency contacts found in your profile.',
      );
    }

    final locationResult = await _locationService.getCurrentLocationLink();
    final locationUrl = locationResult.mapsUrl;
    debugPrint(
      '[PanicEmergency] Location result: success=${locationResult.success}, '
      'message=${locationResult.message}, url=${locationResult.mapsUrl ?? 'n/a'}',
    );

    final smsBody = _buildEmergencyMessage(
      userName: userName,
      userPhone: userPhone,
      locationUrl: locationUrl,
      locationStatusMessage: locationResult.message,
    );

    final smsResult = await _smsService.sendEmergencySms(
      contacts: contacts,
      body: smsBody,
      allowComposerFallback: false,
    );

    var smsSuccess = smsResult.success;
    var smsMessage = smsResult.message;
    debugPrint(
      '[PanicEmergency] SMS result: success=${smsResult.success}, '
      'openedComposer=${smsResult.openedComposer}, '
      'sent=${smsResult.sentContacts.length}, '
      'failed=${smsResult.failedContacts.length}, '
      'message=${smsResult.message}',
    );

    if (!smsSuccess) {
      final backendSmsResult = await _backendSmsService.sendEmergencySms(
        contacts: contacts,
        body: smsBody,
      );

      smsSuccess = backendSmsResult.success;
      smsMessage = '${smsResult.message} ${backendSmsResult.message}'.trim();
      debugPrint(
        '[PanicEmergency] Backend SMS result: success=${backendSmsResult.success}, '
        'sent=${backendSmsResult.sentContacts.length}, '
        'failed=${backendSmsResult.failedContacts.length}, '
        'message=${backendSmsResult.message}',
      );
    }

    if (!smsSuccess) {
      final composerFallbackResult = await _smsService.sendEmergencySms(
        contacts: contacts,
        body: smsBody,
        allowComposerFallback: true,
      );

      smsSuccess = composerFallbackResult.success;
      smsMessage = '$smsMessage ${composerFallbackResult.message}'.trim();
      debugPrint(
        '[PanicEmergency] Composer fallback result: success=${composerFallbackResult.success}, '
        'openedComposer=${composerFallbackResult.openedComposer}, '
        'message=${composerFallbackResult.message}',
      );

      if (composerFallbackResult.openedComposer) {
        final message = [
          smsMessage,
          if (!locationResult.success) locationResult.message,
        ].join(' ');

        return PanicAlertResult(
          success: false,
          message: '$message Please tap send in your messaging app.',
          locationUrl: locationUrl,
        );
      }
    }

    final callResult = await _callService.callPrimaryContact(contacts.first);
    debugPrint(
      '[PanicEmergency] Call result: success=${callResult.success}, '
      'message=${callResult.message}',
    );

    final success = smsSuccess || callResult.success;
    final message = [
      smsMessage,
      callResult.message,
      if (!locationResult.success) locationResult.message,
    ].join(' ');

    return PanicAlertResult(
      success: success,
      message: message,
      locationUrl: locationUrl,
    );
  }

  Future<List<String>> _fetchEmergencyContacts() async {
    final userRef = currentUserReference;
    if (userRef == null) {
      return _parseContacts(FFAppState().emergencyContact);
    }

    try {
      final userDoc = await UsersRecord.getDocumentOnce(userRef);
      final rawContacts = userDoc.contactEmergency;
      final parsed = _parseContacts(rawContacts);
      if (parsed.isNotEmpty) {
        return parsed;
      }
      return _parseContacts(FFAppState().emergencyContact);
    } catch (_) {
      final fallbackRemote = _parseContacts(currentUserDocument?.contactEmergency ?? '');
      if (fallbackRemote.isNotEmpty) {
        return fallbackRemote;
      }
      return _parseContacts(FFAppState().emergencyContact);
    }
  }

  List<String> _parseContacts(String raw) {
    if (raw.trim().isEmpty) {
      return const <String>[];
    }

    final chunks = raw.split(RegExp(r'[,;|\n]'));
    final unique = <String>{};

    for (final entry in chunks) {
      final normalized = entry.replaceAll(RegExp(r'[^0-9+]'), '').trim();
      if (normalized.isNotEmpty) {
        unique.add(normalized);
      }
    }

    return unique.toList(growable: false);
  }

  String _buildEmergencyMessage({
    required String userName,
    required String userPhone,
    required String? locationUrl,
    required String locationStatusMessage,
  }) {
    final safeName = userName.isEmpty ? 'A user' : userName;
    final safePhone = userPhone.isEmpty ? 'Unavailable' : userPhone;
    final safeLocation = locationUrl ?? 'Location unavailable ($locationStatusMessage)';

    return 'Emergency Alert from ElderBlissCare: $safeName needs immediate help. '
        'Phone: $safePhone. Live location: $safeLocation';
  }
}
