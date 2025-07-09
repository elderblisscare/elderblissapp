import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _googleSignIn = GoogleSignIn.instance;

Future<void> initializeGoogleSignIn() async {
  await _googleSignIn.initialize(
    // You can add clientId here if needed
    // clientId: 'your-client-id.apps.googleusercontent.com',
  );
}

Future<UserCredential?> googleSignInFunc() async {
  if (kIsWeb) {
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
  }

  await signOutWithGoogle().catchError((_) => null);
  
  // Initialize if not already done
  await initializeGoogleSignIn();
  
  final auth = await (await _googleSignIn.authenticate(
    scopeHint: ['profile', 'email']
  )).authentication;
  final credential = GoogleAuthProvider.credential(idToken: auth.idToken);
  return FirebaseAuth.instance.signInWithCredential(credential);
}

Future signOutWithGoogle() => _googleSignIn.signOut();
