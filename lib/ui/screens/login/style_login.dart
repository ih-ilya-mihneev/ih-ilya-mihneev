import 'package:flutter/material.dart';
import 'package:zephyr/res/theme/zephyr_theme.dart';

class LoginStyle {
  final Color backgroundColor;
  final TextStyle captionTextStyle;
  final Color loginButtonColor;
  final TextStyle textFieldTextStyle;
  final TextStyle titleTextStyle;
  final TextStyle rememberMeTextStyle;
  final TextStyle loginButtonTextStyle;
  final double blurRadius = 6.0;
  final Offset shadowOffset = Offset(0.0, 3.5);

  LoginStyle.fromTheme(ZephyrTheme theme)
      : backgroundColor = const Color.fromRGBO(246, 246, 246, 1),
        loginButtonColor = const Color.fromRGBO(0, 113, 188, 1),
        captionTextStyle = theme.textStyles.h2.get(color: theme.colors.red),
        textFieldTextStyle = theme.textStyles.b1.get(color: theme.colors.black),
        titleTextStyle = theme.textStyles.h2.get(color: theme.colors.black),
        rememberMeTextStyle =
            theme.textStyles.b2.get(color: theme.colors.black),
        loginButtonTextStyle =
            theme.textStyles.h4.get(color: theme.colors.white);
}
