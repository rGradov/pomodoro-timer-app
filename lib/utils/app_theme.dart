import 'package:flutter/material.dart';

// abstract class PomodoroColors {
//   ThemeExtension<IPomodoroColors> get colorTheme();
// }
/// FIXME: should be one theme extentiuon with 3 color types
abstract base class PomodoroColors<T extends ThemeExtension<T>>
    extends ThemeExtension<T> {
  const PomodoroColors({required this.mainColor, required this.errorColor});
  final Color mainColor;
  final Color errorColor;
}

final class FocusColor extends PomodoroColors<FocusColor> {
  const FocusColor({required Color mainColor, required Color errorColor})
      : super(mainColor: mainColor, errorColor: errorColor);

  @override
  ThemeExtension<FocusColor> copyWith({Color? mainColor, Color? errorColor}) {
    return FocusColor(
        mainColor: mainColor ?? this.mainColor,
        errorColor: errorColor ?? this.errorColor);
  }

  @override
  ThemeExtension<FocusColor> lerp(
      covariant ThemeExtension<FocusColor>? other, double t) {
    if (other is! FocusColor) {
      return this;
    }
    return FocusColor(
        mainColor: Color.lerp(mainColor, other.mainColor, t)!,
        errorColor: Color.lerp(errorColor, other.errorColor, t)!);
  }

  static const light =
      FocusColor(mainColor: Color(0xFFFFD9D9), errorColor: Color(0xFFFFD9D9));
}

final class ShortBreakColors extends PomodoroColors<ShortBreakColors> {
  const ShortBreakColors({required Color mainColor, required Color errorColor})
      : super(mainColor: mainColor, errorColor: errorColor);

  @override
  ThemeExtension<ShortBreakColors> copyWith(
      {Color? mainColor, Color? errorColor}) {
    return ShortBreakColors(
        mainColor: mainColor ?? this.mainColor,
        errorColor: errorColor ?? this.errorColor);
  }

  @override
  ThemeExtension<ShortBreakColors> lerp(
      covariant ThemeExtension<ShortBreakColors>? other, double t) {
    if (other is! ShortBreakColors) {
      return this;
    }
    return ShortBreakColors(
        mainColor: Color.lerp(mainColor, other.mainColor, t)!,
        errorColor: Color.lerp(errorColor, other.errorColor, t)!);
  }

  static const light = ShortBreakColors(
      mainColor: Color(0xFFFFD9D9), errorColor: Color(0xFFFFD9D9));
}

final class LongBreakColors extends PomodoroColors<LongBreakColors> {
  const LongBreakColors({required Color mainColor, required Color errorColor})
      : super(mainColor: mainColor, errorColor: errorColor);

  @override
  ThemeExtension<LongBreakColors> copyWith(
      {Color? mainColor, Color? errorColor}) {
    return LongBreakColors(
        mainColor: mainColor ?? this.mainColor,
        errorColor: errorColor ?? this.errorColor);
  }

  @override
  ThemeExtension<LongBreakColors> lerp(
      covariant ThemeExtension<LongBreakColors>? other, double t) {
    if (other is! LongBreakColors) {
      return this;
    }
    return LongBreakColors(
        mainColor: Color.lerp(mainColor, other.mainColor, t)!,
        errorColor: Color.lerp(errorColor, other.errorColor, t)!);
  }

  static const light = LongBreakColors(
      mainColor: Color(0xFFFFD9D9), errorColor: Color(0xFFFFD9D9));
}
