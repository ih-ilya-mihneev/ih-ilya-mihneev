import 'package:flutter/material.dart';

import '../dimens.dart';

class ZephyrTextStyles {

  final ZephyrTextStyle h1;
  final ZephyrTextStyle h2;
  final ZephyrTextStyle h3;
  final ZephyrTextStyle h4;
  final ZephyrTextStyle b1;
  final ZephyrTextStyle b2;
  final ZephyrTextStyle c1;
  final ZephyrTextStyle c2;

  ZephyrTextStyles({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.b1,
    required this.b2,
    required this.c1,
    required this.c2
  });

  factory ZephyrTextStyles.defaultTextStyles() {
    return _defaultTextStyles();
  }

}

ZephyrTextStyles _defaultTextStyles() =>
    ZephyrTextStyles(
        h1: ZephyrTextStyle(Dimens.h1, FontWeight.w700),
        h2: ZephyrTextStyle(Dimens.h2, FontWeight.w700),
        h3: ZephyrTextStyle(Dimens.h3, FontWeight.w700),
        h4: ZephyrTextStyle(Dimens.h4, FontWeight.w700),
        b1: ZephyrTextStyle(Dimens.body1, FontWeight.w400),
        b2: ZephyrTextStyle(Dimens.body2, FontWeight.w400),
        c1: ZephyrTextStyle(Dimens.caption1, FontWeight.w400),
        c2: ZephyrTextStyle(Dimens.caption2, FontWeight.w400),
    );

class ZephyrTextStyle {

  final double _size;
  final FontWeight _weight;

  ZephyrTextStyle(this._size, this._weight);

  TextStyle get({Color? color}) => TextStyle(fontSize: _size, fontWeight: _weight, color: color ?? const Color(0xDE000000));

  /** Here we can add some methods for fonts custom stuff */

}

