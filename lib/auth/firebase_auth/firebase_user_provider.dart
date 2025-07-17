import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import '../base_auth_user_provider.dart';

export '../base_auth_user_provider.dart';

class Elderblisscare1FirebaseUser extends BaseAuthUser {
  Elderblisscare1FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;

  @override
  AuthUserInfo get authUserInfo => AuthUserInfo(
        uid: user?.uid,
        email: user?.email,
        displayName: user?.displayName,
        photoUrl: user?.photoURL,
        phoneNumber: user?.phoneNumber,
      );

  @override
  Future? delete() => user?.delete();

  @override
  Future? updateEmail(String email) async {
    try {
      await user?.updateEmail(email);
    } catch (_) {
      await user?.verifyBeforeUpdateEmail(email);
    }
  }

  @override
  Future? updatePassword(String newPassword) async {
    await user?.updatePassword(newPassword);
  }

  @override
  Future? sendEmailVerification() => user?.sendEmailVerification();

  @override
  bool get emailVerified {
    // Reloads the user when checking in order to get the most up to date
    // email verified status.
    if (loggedIn && !user!.emailVerified) {
      refreshUser();
    }
    return user?.emailVerified ?? false;
  }

  @override
  Future refreshUser() async {
    await FirebaseAuth.instance.currentUser
        ?.reload()
        .then((_) => user = FirebaseAuth.instance.currentUser);
  }

  static BaseAuthUser fromUserCredential(UserCredential userCredential) =>
      fromFirebaseUser(userCredential.user);
  static BaseAuthUser fromFirebaseUser(User? user) =>
      Elderblisscare1FirebaseUser(user);
}

Stream<BaseAuthUser> elderblisscare1FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .map<BaseAuthUser>(
      (user) {
        currentUser = Elderblisscare1FirebaseUser(user);
        if (!kIsWeb) {
          FirebaseCrashlytics.instance.setUserIdentifier(user?.uid ?? '');
        }
        return currentUser!;
      },
    );
