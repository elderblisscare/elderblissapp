import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../environment_values.dart';
import '../auth/firebase_auth/auth_util.dart';
import '../flutter_flow/flutter_flow_util.dart';

class RazorpayService {
  static final RazorpayService _instance = RazorpayService._internal();
  factory RazorpayService() => _instance;
  RazorpayService._internal();

  Razorpay? _razorpay;

  void initialize() {
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    _razorpay?.clear();
  }

  Future<void> openCheckout({
    required BuildContext context,
    required String planName,
    required double amount, // Amount in rupees
    required String planId,
    String? description,
    VoidCallback? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      final environmentValues = FFDevEnvironmentValues();
      final user = currentUser;
      
      var options = {
        'key': environmentValues.razorpayKeyId,
        'amount': (amount * 100).round(), // Amount in paisa
        'name': 'ElderBlissCare',
        'description': description ?? '$planName - Healthcare Plan',
        'retry': {'enabled': true, 'max_count': 1},
        'send_sms_hash': true,
        'prefill': {
          'contact': user?.phoneNumber ?? '',
          'email': user?.email ?? ''
        },
        'external': {
          'wallets': ['paytm']
        },
        'notes': {
          'plan_name': planName,
          'plan_id': planId,
          'user_id': user?.uid ?? '',
          'company': 'ElderBlissCare',
        },
        'theme': {
          'color': '#C71F38'
        }
      };

      // Add ElderBlissCare logo for web platform
      if (kIsWeb) {
        options['image'] = '/favicon.png'; // ElderBlissCare logo from assets/images
      }

      _razorpay?.open(options);
      
      // Store callbacks for later use
      _successCallback = onSuccess;
      _errorCallback = onError;
      
    } catch (e) {
      debugPrint('Error opening Razorpay checkout: $e');
      if (onError != null) {
        onError('Payment initialization failed: $e');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Payment initialization failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  VoidCallback? _successCallback;
  Function(String)? _errorCallback;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    debugPrint('Payment Success: ${response.paymentId}');
    
    // Log the successful payment
    logFirebaseEvent('payment_success', parameters: {
      'payment_id': response.paymentId ?? '',
      'order_id': response.orderId ?? '',
      'signature': response.signature ?? '',
    });
    
    if (_successCallback != null) {
      _successCallback!();
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint('Payment Error: ${response.code} - ${response.message}');
    
    // Log the payment failure
    logFirebaseEvent('payment_error', parameters: {
      'error_code': response.code?.toString() ?? '',
      'error_message': response.message ?? '',
    });
    
    String errorMessage = 'Payment failed';
    
    // Provide user-friendly error messages
    switch (response.code) {
      case Razorpay.NETWORK_ERROR:
        errorMessage = 'Network error. Please check your internet connection.';
        break;
      case Razorpay.INVALID_OPTIONS:
        errorMessage = 'Payment configuration error. Please contact support.';
        break;
      case Razorpay.PAYMENT_CANCELLED:
        errorMessage = 'Payment was cancelled.';
        break;
      case Razorpay.TLS_ERROR:
        errorMessage = 'Security error. Please update your device and try again.';
        break;
      case Razorpay.UNKNOWN_ERROR:
        errorMessage = 'An unexpected error occurred. Please try again.';
        break;
      default:
        errorMessage = response.message ?? 'Payment failed. Please try again.';
    }
    
    if (_errorCallback != null) {
      _errorCallback!(errorMessage);
    }
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint('External Wallet: ${response.walletName}');
    
    // Log external wallet usage
    logFirebaseEvent('external_wallet_selected', parameters: {
      'wallet_name': response.walletName ?? '',
    });
  }

  // Helper method to format amount for display
  static String formatAmount(double amount) {
    return '₹${amount.toStringAsFixed(0)}';
  }

  // Method to validate payment amount
  static bool isValidAmount(double amount) {
    return amount > 0 && amount <= 500000; // Max limit as per RBI guidelines
  }
} 