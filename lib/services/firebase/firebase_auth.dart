import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:track_dog/services/firebase/error_translate_firebase.dart';

Future<String> registerEmailPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return "";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<String> loginEmailPassword(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return "";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<String> forgetPassword(String email) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    return "";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}

Future<String> verifyEmail() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      return "";
    } else if (user != null && user.emailVerified) {
      return "Email already verified";
    }
    return "No user signed in";
  } on FirebaseAuthException catch (e) {
    return getMessageFromErrorCode(e.code);
  } catch (e) {
    log(e.toString());
    return "";
  }
}
