import '/auth/firebase_auth/auth_util.dart';
import '/services/panic/panic_emergency_service.dart';
import 'package:flutter/material.dart';

class PanicAlertButtonWidget extends StatefulWidget {
  const PanicAlertButtonWidget({super.key});

  @override
  State<PanicAlertButtonWidget> createState() => _PanicAlertButtonWidgetState();
}

class _PanicAlertButtonWidgetState extends State<PanicAlertButtonWidget> {
  final PanicEmergencyService _panicEmergencyService = PanicEmergencyService();
  bool _isSending = false;

  Future<void> _triggerEmergencyFlow() async {
    if (_isSending) {
      return;
    }

    setState(() => _isSending = true);

    final result = await _panicEmergencyService.triggerEmergencyAlert(
      userName: currentUserDisplayName,
      userPhone: currentPhoneNumber,
    );

    if (!mounted) {
      return;
    }

    setState(() => _isSending = false);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result.message),
        backgroundColor: result.success ? Colors.green : Colors.red,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 36),
            const SizedBox(height: 8),
            const Text(
              'Emergency Panic Alert',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sends your live location via SMS to emergency contacts and starts a call to your primary contact.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isSending ? null : _triggerEmergencyFlow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: _isSending
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.emergency),
                label: Text(_isSending ? 'Sending Alert...' : 'Trigger Panic Alert'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
