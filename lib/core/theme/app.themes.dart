import 'package:flutter/material.dart';
import 'package:pokemon/core/theme/dark.theme.dart';
import 'package:pokemon/core/theme/light.theme.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon/core/view_models/export.view_models.dart';

enum ThemesMode {
  light(0),

  dark(1);

  const ThemesMode(this.modeInt);
  final int modeInt;
}

class AppThemes {
  AppThemes._();

  static final light = lightTheme;
  static final dark = darkTheme;

  static CustomTheme customAppTheme(WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    if(isDarkMode) {
      return DarkTheme();
    } else {
      return LightTheme();
    }
  }
}

abstract class CustomTheme {
  Color get invertColor;
  Color get totalInverseColor;
  Color get inverseColor;
  Color get inverseTextColor;
  Color get buttonNotActiveColor;
  Color get buttonNotActiveTextColor;
}

class LightTheme extends CustomTheme {
  @override
  Color get totalInverseColor => white;

  @override
  Color get invertColor => white;

  @override
  Color get inverseColor => black;

  @override
  Color get inverseTextColor => black;

  @override
  Color get buttonNotActiveColor => Colors.red;

  @override
  Color get buttonNotActiveTextColor => white;
}

class DarkTheme extends CustomTheme {
  @override
  Color get totalInverseColor => white;

  @override
  Color get inverseColor => white;

  @override
  Color get invertColor => black;

  @override
  Color get inverseTextColor => black;

  @override
  Color get buttonNotActiveColor => Colors.grey;

  @override
  Color get buttonNotActiveTextColor => white;
}