// ignore_for_file: use_build_context_synchronously

import 'package:ecommerceapp_firebase/constants/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance= FirebaseAuthHelper();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get getAuthChange => _firebaseAuth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      appToast("Welcome to Food $email");
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      var errorCode =e.code.toString();
      var authError = getMessageFromErrorCode(errorCode);
      debugPrint('error Message: $authError');
      debugPrint('errorCode : $errorCode');

      appToast(authError);
      Navigator.of(context).pop();
      return false;
    }
  }

  Future<bool> signUp(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      appToast("Welcome to Food $email");
      Navigator.of(context).pop();
      return true;
    } on FirebaseAuthException catch (e) {
      var errorCode =e.code.toString();
      var authError = getMessageFromErrorCode(errorCode);
      debugPrint('error Message: $authError');
      debugPrint('errorCode : $errorCode');

      appToast(authError);
      Navigator.of(context).pop();
      return false;
    }

  }

}
