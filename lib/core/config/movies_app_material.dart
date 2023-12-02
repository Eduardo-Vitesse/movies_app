import 'package:flutter/material.dart';
import 'package:movies_app/core/config/movies_app_colors.dart';

class MoviesAppMaterial {
  static final MoviesAppMaterial _singleton = MoviesAppMaterial._internal();

  factory MoviesAppMaterial() {
    return _singleton;
  }

  MoviesAppMaterial._internal();

  static const String title = 'Movies App';
  static const Locale locale = Locale('pt_BR');
  static ThemeData get getTheme => ThemeData(
        scaffoldBackgroundColor: MoviesAppColors.primaryColor,
        primaryColor: MoviesAppColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: MoviesAppColors.primaryColor,
          titleTextStyle: TextStyle(
            color: MoviesAppColors.whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        fontFamily: 'Lato',
      );
}
