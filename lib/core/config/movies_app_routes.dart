import 'package:flutter/material.dart';

import 'package:movies_app/presentation/login/screens/login_screen.dart';
import 'package:movies_app/presentation/movie_details/screens/movie_details_screen.dart';
import 'package:movies_app/presentation/nav/screens/nav_screen.dart';
import 'package:movies_app/presentation/signup/screens/signup_screen.dart';
import 'package:movies_app/presentation/splash/screens/splash_screen.dart';

class MoviesAppRoutes {
  static final MoviesAppRoutes _singleton = MoviesAppRoutes._internal();

  factory MoviesAppRoutes() {
    return _singleton;
  }

  MoviesAppRoutes._internal();

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      SplashScreen.routeName: (_) => const SplashScreen(),
      LoginScreen.routeName: (_) => const LoginScreen(),
      SignUpScreen.routeName: (_) => const SignUpScreen(),
      NavScreen.routeName: (_) => const NavScreen(),
      MovieDetailsSCreen.routeName: (_) => const MovieDetailsSCreen(),
    };
  }
}
