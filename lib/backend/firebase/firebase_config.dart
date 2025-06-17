import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDKkMMb50cl4_jDTMoqXDHlkjwjfniO9HE",
            authDomain: "elderblisscare1.firebaseapp.com",
            projectId: "elderblisscare1",
            storageBucket: "elderblisscare1.firebasestorage.app",
            messagingSenderId: "528225851763",
            appId: "1:528225851763:web:e2eba79fadfb7aa39a4d06",
            measurementId: "G-7JNZVVF1EH"));
  } else {
    // Initialize with platform-specific options if needed
    await Firebase.initializeApp();
    
    // Force a reload of Firebase messaging token for notifications
    try {
      // This will ensure Firebase services are fully initialized
      final firebaseApp = Firebase.app();
      print("Firebase successfully initialized: ${firebaseApp.name}");
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
  }
}
