import 'package:flutter/material.dart';

import '../../../core/extensions/ui/sizes_extension.dart';
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
import '../controllers/signup_controller.dart';
import '../mixins/signup_focus_nodes_mixin.dart';
import '../mixins/signup_text_editing_controller_mixin.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with
        NavigationMixin,
        LoadingErrorMixin,
        SnackBarMixin,
        SignupFocusNodesMixin,
        SignupTextEditingControllerMixin {
  late SignupController signupCtrl;
  void onSignup(BuildContext context) async {
    setIsLoading(true);
    setError(null);

    final (errorMessage, success) =
        await signupCtrl.onSignup(emailTEC.text, passwordTEC.text);

    if (success && context.mounted) {
      handleNavigation(context, NavScreen.routeName);
    } else {
      setIsLoading(false);
      if (errorMessage != null) {
        showSnackBar(context, errorMessage, MessageType.error);
      }
    }
  }

  @override
  void initState() {
    signupCtrl = SignupController();
    setIsLoading(false);
    super.initState();
  }

  @override
  void dispose() {
    disposeFN();
    disposeTECs();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: signupCtrl.signupFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizesEnum.lg.getSize),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBoxWidget.lg(),
                TextWidget.title('Registrar'),
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
                  onFieldSubmitted: (_) => onSignup(context),
                  textInputAction: TextInputAction.send,
                ),
                const SizedBoxWidget.xxl(),
                ButtonWidget(
                  label: 'Registrar',
                  onPressed: () => onSignup(context),
                  isBlock: true,
                  isLoading: isLoading,
                ),
                const SizedBoxWidget.lg(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
