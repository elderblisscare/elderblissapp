import 'package:cloud_functions/cloud_functions.dart';

class BackendSmsResult {
  const BackendSmsResult({
    required this.success,
    required this.message,
    this.sentContacts = const <String>[],
    this.failedContacts = const <String>[],
  });

  final bool success;
  final String message;
  final List<String> sentContacts;
  final List<String> failedContacts;
}

class BackendSmsService {
  static const List<String> _regionsToTry = <String>[
    'us-central1',
    'asia-south1',
    'asia-east1',
    'europe-west1',
  ];

  Future<BackendSmsResult> sendEmergencySms({
    required List<String> contacts,
    required String body,
  }) async {
    if (contacts.isEmpty) {
      return const BackendSmsResult(
        success: false,
        message: 'No contacts available for backend SMS.',
      );
    }

    FirebaseFunctionsException? lastFunctionError;
    Object? lastOtherError;

    for (final region in _regionsToTry) {
      try {
        final callable = FirebaseFunctions.instanceFor(region: region)
            .httpsCallable('sendEmergencySmsViaProvider');

        final response = await callable.call(<String, dynamic>{
          'contacts': contacts,
          'body': body,
        });

        final data = Map<String, dynamic>.from(response.data as Map);
        final sentContacts =
            (data['sentContacts'] as List<dynamic>? ?? const <dynamic>[])
                .map((e) => e.toString())
                .toList(growable: false);
        final failedContacts =
            (data['failedContacts'] as List<dynamic>? ?? const <dynamic>[])
                .map((e) => e.toString())
                .toList(growable: false);

        return BackendSmsResult(
          success: data['success'] == true,
          message: data['message']?.toString() ?? 'Backend SMS request processed.',
          sentContacts: sentContacts,
          failedContacts: failedContacts,
        );
      } on FirebaseFunctionsException catch (e) {
        lastFunctionError = e;
        // If function is missing in this region, try next region automatically.
        if (e.code == 'not-found') {
          continue;
        }
        break;
      } catch (e) {
        lastOtherError = e;
        break;
      }
    }

    if (lastFunctionError != null && lastFunctionError.code == 'not-found') {
      return const BackendSmsResult(
        success: false,
        message:
            'Backend SMS service is not deployed yet. Ask admin to deploy sendEmergencySmsViaProvider.',
      );
    }

    if (lastFunctionError != null) {
      final details =
          lastFunctionError.message ?? 'Firebase Functions error (${lastFunctionError.code}).';
      return BackendSmsResult(
        success: false,
        message: 'Backend SMS request failed: $details',
      );
    }

    return BackendSmsResult(
      success: false,
      message: 'Backend SMS request failed: ${lastOtherError ?? 'unknown error'}',
    );
  }
}
