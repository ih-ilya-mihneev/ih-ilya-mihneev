import 'package:zephyr/res/theme/zephyr_colors.dart';
import 'package:zephyr/res/theme/zephyr_text_styles.dart';

class ZephyrTheme {
  final ZephyrColors colors;
  final ZephyrTextStyles textStyles;

  ZephyrTheme({required this.colors, required this.textStyles});

  factory ZephyrTheme.defaultTheme() => _default();

  ZephyrTheme copyWith({ZephyrColors? colors, ZephyrTextStyles? textStyles}) =>
      ZephyrTheme(
          colors: colors ?? this.colors,
          textStyles: textStyles ?? this.textStyles);
}

ZephyrTheme _default() => ZephyrTheme(
    colors: ZephyrColors.defaultColors(),
    textStyles: ZephyrTextStyles.defaultTextStyles());
