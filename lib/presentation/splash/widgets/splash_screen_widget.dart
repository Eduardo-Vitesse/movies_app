import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/const/assets_paths_const.dart';
import '../../../core/mixins/navigation_mixin.dart';
import '../../../core/services/firebase/firebase_auth_service.dart';
import '../../../core/widgets/sized_box/sized_box_widget.dart';
import '../../../core/widgets/texts/text_widget.dart';
import '../../login/screens/login_screen.dart';
import '../../nav/screens/nav_screen.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with NavigationMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      final user = FirebaseAuthService.getUser;
      if (context.mounted) {
        if (user == null) {
          handleNavigation(context, LoginScreen.routeName, clear: true);
        } else {
          handleNavigation(context, NavScreen.routeName, clear: true);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Lottie.asset(AssetsPathsConst.animationSplash),
          ),
          const SizedBoxWidget.md(),
          TextWidget.title('Loading...'),
        ],
      ),
    );
  }
}
