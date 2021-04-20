import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zephyr/res/dimens.dart';

import 'zephyr_button_style.dart';

class ZephyrButton extends StatefulWidget {
  final ZephyrButtonStyle style;
  final VoidCallback? onPressed;
  final String text;
  final bool enabled;

  ZephyrButton(
      {required this.style,
      this.onPressed,
      this.text = '',
      this.enabled = true});

  @override
  State createState() => _ZephyrButtonState();
}

class _ZephyrButtonState extends State<ZephyrButton> {
  final textStyle = TextStyle(
      fontFamily: 'Lato',
      fontSize: Dimens.h4,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ButtonStyle(
      elevation: MaterialStateProperty.all(widget.style.elevationOpacity),
      shape:
          MaterialStateProperty.resolveWith<RoundedRectangleBorder>(getBorder),
      overlayColor:
          MaterialStateProperty.resolveWith<Color>(getColorBackground),
      backgroundColor:
          MaterialStateProperty.resolveWith<Color>(getColorBackground),
      foregroundColor:
          MaterialStateProperty.resolveWith<Color?>(getColorForeground),
    );

    return Container(
      height: widget.style.height,
      child: ElevatedButton(
        onPressed: widget.enabled ? widget.onPressed : null,
        style: buttonStyle,
        child: Text(
          widget.text,
          style: textStyle,
        ),
      ),
    );
  }

  RoundedRectangleBorder getBorder(Set<MaterialState> states) {
    Color? borderColor = widget.style.colorNormalBorder;
    if (states.contains(MaterialState.pressed))
      borderColor = widget.style.colorPressedBorder;
    if (states.contains(MaterialState.disabled))
      borderColor = widget.style.colorDisabledBorder;

    var borderSide = BorderSide.none;
    if (borderColor != null) {
      borderSide = BorderSide(color: borderColor);
    }
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(widget.style.borderRadius),
      side: borderSide,
    );
  }

  Color getColorBackground(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed))
      return widget.style.colorPressedBg;
    if (states.contains(MaterialState.disabled))
      return widget.style.colorDisabledBg;

    return widget.style.colorNormalBg;
  }

  Color getColorForeground(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed))
      return widget.style.colorPressedText;
    if (states.contains(MaterialState.disabled))
      return widget.style.colorDisabledText;

    return widget.style.colorNormalText;
  }
}
