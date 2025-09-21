import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  String? _razorpayKeyId;
  String? _razorpayKeySecret;

  String get razorpayKeyId => _razorpayKeyId ?? '';
  String get razorpayKeySecret => _razorpayKeySecret ?? '';

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      
      _razorpayKeyId = data['razorpay_key_id'];
      _razorpayKeySecret = data['razorpay_key_secret'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }
}
