import 'dart:ui';

import 'package:zephyr/res/dimens.dart';
import 'package:zephyr/res/theme/zephyr_theme.dart';

class ZephyrButtonStyle {
  final double height;

  final Color colorNormalBg;
  final Color colorDisabledBg;
  final Color colorPressedBg;

  final Color colorNormalText;
  final Color colorPressedText;
  final Color colorDisabledText;

  final Color? colorNormalBorder;
  final Color? colorDisabledBorder;
  final Color? colorPressedBorder;

  final double elevationOpacity;

  final double borderRadius;

  ZephyrButtonStyle.fromThemeElevated(ZephyrTheme theme,
      {this.height = Dimens.generalButtonHeight,
      this.elevationOpacity = Dimens.opacityNull,
      this.borderRadius = Dimens.generalButtonCornerRadius})
      : this.colorNormalBg = theme.colors.blue,
        this.colorDisabledBg = theme.colors.black.withOpacity(Dimens.opacity10),
        this.colorPressedBg = theme.colors.blue1,
        this.colorNormalText = theme.colors.white,
        this.colorDisabledText =
            theme.colors.black.withOpacity(Dimens.opacity40),
        this.colorPressedText = theme.colors.white,
        this.colorNormalBorder = null,
        this.colorDisabledBorder = null,
        this.colorPressedBorder = null;

  ZephyrButtonStyle.fromThemeOutlined(ZephyrTheme theme,
      {this.height = Dimens.generalButtonHeight,
      this.elevationOpacity = Dimens.opacityNull,
      this.borderRadius = Dimens.generalButtonCornerRadius})
      : this.colorNormalBg = theme.colors.white,
        this.colorDisabledBg = theme.colors.white,
        this.colorPressedBg = theme.colors.white,
        this.colorNormalText = theme.colors.blue,
        this.colorDisabledText =
            theme.colors.black.withOpacity(Dimens.opacity40),
        this.colorPressedText = theme.colors.blue.withOpacity(Dimens.opacity50),
        this.colorNormalBorder = theme.colors.blue,
        this.colorDisabledBorder =
            theme.colors.black.withOpacity(Dimens.opacity10),
        this.colorPressedBorder =
            theme.colors.blue.withOpacity(Dimens.opacity50);

  ZephyrButtonStyle.fromThemeText(ZephyrTheme theme,
      {this.height = Dimens.generalButtonHeight,
      this.elevationOpacity = Dimens.opacityNull,
      this.borderRadius = Dimens.generalButtonCornerRadius})
      : this.colorNormalBg = theme.colors.white,
        this.colorDisabledBg = theme.colors.white,
        this.colorPressedBg = theme.colors.white,
        this.colorNormalText = theme.colors.blue,
        this.colorDisabledText =
            theme.colors.black.withOpacity(Dimens.opacity40),
        this.colorPressedText = theme.colors.blue.withOpacity(Dimens.opacity50),
        this.colorNormalBorder = null,
        this.colorDisabledBorder = null,
        this.colorPressedBorder = null;
}
