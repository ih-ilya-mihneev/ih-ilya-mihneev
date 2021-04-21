import 'package:flutter/material.dart';

class ZephyrColors {
  @required
  final Color blue;
  final Color orange;
  final Color green;
  final Color red;
  final Color black;
  final Color gray1;
  final Color gray2;
  final Color gray3;
  final Color white;
  final Color lightBackground;

  ZephyrColors(
      {required this.blue,
      required this.orange,
      required this.green,
      required this.red,
      required this.black,
      required this.gray1,
      required this.gray2,
      required this.gray3,
      required this.white,
      required this.lightBackground});

  factory ZephyrColors.defaultColors() {
    return _defaultColors();
  }
}

ZephyrColors _defaultColors() => ZephyrColors(
    blue: Color(0xFF0071BC),
    orange: Color(0xFFE08300),
    green: Color(0xFF1DA33F),
    red: Color(0xFFCF0026),
    /** Currently for black and gray colors we gonna use Black(#000000)
    with different opacities, but in future we can change it, if will face
        with some problems */
    black: Color(0xDE000000),
    gray1: Color(0xA6000000),
    gray2: Color(0x61000000),
    gray3: Color(0x33000000),
    white: Color(0xFFFFFFFF),
    lightBackground: Color(0xF6F6F6F6));
