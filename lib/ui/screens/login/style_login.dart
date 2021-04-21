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
  final BoxShadow loginContainerBoxShadow;

  LoginStyle.fromTheme(ZephyrTheme theme)
      : loginContainerBoxShadow = BoxShadow(
          offset: Offset(0.0, 3.5),
          color: Colors.grey,
          blurRadius: 6.0,
        ),
        backgroundColor = theme.colors.lightBackground,
        loginButtonColor = const Color.fromRGBO(0, 113, 188, 1),
        captionTextStyle = theme.textStyles.h2.get(color: theme.colors.red),
        textFieldTextStyle = theme.textStyles.b1.get(color: theme.colors.black),
        titleTextStyle = theme.textStyles.h2.get(color: theme.colors.black),
        rememberMeTextStyle =
            theme.textStyles.b2.get(color: theme.colors.black),
        loginButtonTextStyle =
            theme.textStyles.h4.get(color: theme.colors.white);
}
