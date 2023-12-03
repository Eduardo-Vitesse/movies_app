import 'package:flutter/material.dart';
import 'package:movies_app/core/config/movies_app_colors.dart';

class MoviesAppTextStyles {
  static final MoviesAppTextStyles _singleton = MoviesAppTextStyles._internal();

  factory MoviesAppTextStyles() {
    return _singleton;
  }

  MoviesAppTextStyles._internal();

  static TextStyle get getNormalStyle => TextStyle(
        color: MoviesAppColors.whiteColor,
        fontSize: 14,
      );

  static TextStyle get getNormalBoldStyle => getNormalStyle.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get getTitleStyle => getNormalBoldStyle.copyWith(
        fontSize: 24,
      );

  static TextStyle get getSmallStyle => getNormalStyle.copyWith(
        fontSize: 12,
      );
}
