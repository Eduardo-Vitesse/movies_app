import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/extensions/ui/sizes_extension.dart';
import '../../../core/const/assets_paths_const.dart';
import '../../../core/enums/sizes_enum.dart';
import '../../../core/mixins/loading_error_mixin.dart';
import '../../../core/mixins/navigation_mixin.dart';
import '../../../core/mixins/snack_bar_mixin.dart';
import '../../../core/validators/email_validator.dart';
import '../../../core/validators/password_validator.dart';
import '../../../core/widgets/buttons/button_widget.dart';
import '../../../core/widgets/inputs/text_form_field_widget.dart';
import '../../../core/widgets/sized_box/sized_box_widget.dart';
import '../../../core/widgets/texts/text_widget.dart';
import '../../nav/screens/nav_screen.dart';
import '../../signup/screens/signup_screen.dart';
import '../controllers/login_controller.dart';
import '../mixins/login_focus_nodes_mixin.dart';
import '../mixins/login_text_editing_controllers.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with
        LoginFocusNodesMixin,
        LoginTextEditingControllerMixin,
        NavigationMixin,
        LoadingErrorMixin,
        SnackBarMixin {
  late LoginController loginCtrl;

  void onLogin() async {
    setIsLoading(true);
    final error = await loginCtrl.onLogin(emailTEC.text, passwordTEC.text);

    if (error != null && context.mounted) {
      setIsLoading(false);
      showSnackBar(context, error, MessageType.error);
    } else {
      if (context.mounted) {
        handleNavigation(context, NavScreen.routeName, clear: true);
      }
    }
  }

  @override
  void initState() {
    loginCtrl = LoginController();
    setIsLoading(false);
    super.initState();
  }

  @override
  void dispose() {
    disposeFN();
    disposeLoginTEC();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: loginCtrl.loginFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizesEnum.lg.getSize),
            child: SizedBox.expand(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBoxWidget.lg(),
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Lottie.asset(AssetsPathsConst.animationLogin),
                    ),
                    const SizedBoxWidget.md(),
                    TextWidget.title('Movies App'),
                    const SizedBoxWidget.md(),
                    TextFormFieldWidget(
                      inputLabel: 'Email',
                      controller: emailTEC,
                      focusNode: emailFN,
                      validator: EmailValidator.validate,
                      textInputType: TextInputType.emailAddress,
                      onFieldSubmitted: (_) => passwordFN.requestFocus(),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBoxWidget.md(),
                    TextFormFieldWidget(
                      inputLabel: 'Senha',
                      controller: passwordTEC,
                      focusNode: passwordFN,
                      isPassword: true,
                      validator: PasswordValidator.validate,
                      onFieldSubmitted: (_) => onLogin(),
                      textInputAction: TextInputAction.go,
                    ),
                    const SizedBoxWidget.xxl(),
                    ButtonWidget(
                      label: 'Login',
                      onPressed: onLogin,
                      isBlock: true,
                      isLoading: isLoading,
                    ),
                    const SizedBoxWidget.lg(),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(fontSize: 16),
                        children: [
                          const TextSpan(text: 'Ainda não possui uma conta? '),
                          TextSpan(
                            text: 'Registe-se aqui!',
                            style: const TextStyle(
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => handleNavigation(
                                  context, SignUpScreen.routeName),
                          ),
                        ],
                      ),
                    ),
                    const SizedBoxWidget.lg(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
