import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {

  Size _displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double get displayHeight => _displaySize(this).height;

  double get displayWidth => _displaySize(this).width;

}
