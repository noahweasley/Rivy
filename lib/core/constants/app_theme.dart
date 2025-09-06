import 'package:flutter/material.dart';
import 'package:rivy/core/constants/app_font.dart';

class Themes {
  static const darkThemeCode = 0;
  static const lightThemeCode = 1;
  static const defaultThemeCode = 2;

  static final _dark = _baseTheme;
  static final _light = _baseTheme;
  static final _baseTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.degularDisplay,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFDFE1E7)),
      ),
    ),
  );

  static ThemeData getTheme(int? code) {
    if (code == lightThemeCode) {
      return _light;
    } else if (code == darkThemeCode) {
      return _dark;
    } else {
      return _baseTheme;
    }
  }
}
