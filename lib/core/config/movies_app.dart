import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/splash/screens/splash_screen.dart';
import 'movies_app_initial_bindings.dart';
import 'movies_app_material.dart';
import 'movies_app_routes.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MoviesAppInitialBindings.dependencies(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: MoviesAppMaterial.title,
        theme: MoviesAppMaterial.getTheme,
        initialRoute: SplashScreen.routeName,
        routes: MoviesAppRoutes.getRoutes(),
      ),
    );
  }
}
