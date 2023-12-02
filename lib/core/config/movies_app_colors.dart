import 'package:flutter/material.dart';

class MoviesAppColors {
  static final MoviesAppColors _singleton = MoviesAppColors._internal();

  factory MoviesAppColors() {
    return _singleton;
  }

  MoviesAppColors._internal();

  static Color get primaryColor => const Color(0xFF000000);
  static Color get secondaryColor => const Color(0xFF2962ff);
  static Color get errorColor => const Color(0xFFdc3545);
  static Color get favoriteColor => Colors.redAccent;
  static Color get whiteColor => const Color(0xFFffffff);
  static Color get successColor => Colors.green;
}
