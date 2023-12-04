import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/services/firebase/firebase_auth_service.dart';
import '../widgets/splash_screen_widget.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: FirebaseAuthService.getUserStream(context),
      initialData: null,
      child: const Scaffold(
        body: SplashScreenWidget(),
      ),
    );
  }
}
