import 'package:flutter/material.dart';
import 'package:zephyr/res/theme/zephyr_theme.dart';

class LoginStyle {

  final Color backgroundColor;
  final TextStyle captionTextStyle;

  LoginStyle.fromTheme(ZephyrTheme theme) :
      backgroundColor = theme.colors.gray1,
      captionTextStyle = theme.textStyles.h2.get(color: theme.colors.red);

}