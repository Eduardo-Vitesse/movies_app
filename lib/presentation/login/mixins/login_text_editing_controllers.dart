import 'package:flutter/material.dart';

mixin LoginTextEditingControllerMixin {
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  void disposeLoginTEC() {
    emailTEC.dispose();
    passwordTEC.dispose();
  }
}
