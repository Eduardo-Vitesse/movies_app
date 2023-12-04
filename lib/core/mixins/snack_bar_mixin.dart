import 'package:flutter/material.dart';

import '../config/movies_app_colors.dart';
import '../widgets/texts/text_widget.dart';

enum MessageType { success, error }

mixin SnackBarMixin {
  void showSnackBar(
      BuildContext context, String message, MessageType messageType) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: TextWidget.normal(message),
        backgroundColor: messageType == MessageType.error
            ? MoviesAppColors.errorColor
            : MoviesAppColors.successColor,
      ));
  }
}
