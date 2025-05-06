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
    await Firebase.initializeApp();
  }
}
