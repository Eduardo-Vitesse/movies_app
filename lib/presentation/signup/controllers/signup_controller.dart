import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/services/firebase/firebase_auth_service.dart';

class SignupController {
  final signupFormKey = GlobalKey<FormState>();

  Future<(String? error, bool success)> onSignup(
      String email, String password) async {
    if (signupFormKey.currentState!.validate()) {
      final (String? error, UserCredential? user) =
          await FirebaseAuthService.signup(email, password);

      if (user != null) {
        return (null, true);
      }
      return (error, false);
    }
    return (null, false);
  }
}
