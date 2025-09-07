import 'package:flutter/material.dart';
import 'package:rivy/core/constants/app_font.dart';
import 'package:rivy/core/constants/dimensions.dart';
import 'package:rivy/core/utilities/extensions/size_extensions.dart';
import 'package:rivy/core/utilities/size/size_config.dart';

/// An extension on [TextStyle] providing fluent methods for adjusting font weight and letter spacing.
extension StyleExtension on TextStyle {
  /// Applies extra bold weight (`FontWeight.w800`).
  TextStyle get bolder => copyWith(fontWeight: FontWeight.w800);

  /// Applies bold weight (`FontWeight.bold`).
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  /// Applies semi-bold weight (`FontWeight.w600`).
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Applies medium weight (`FontWeight.w500`).
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Applies normal font weight.
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);

  /// Adds wide letter spacing to give a monospaced look.
  TextStyle get monospaced => copyWith(letterSpacing: 5);
}

/// Pre-configured app styles with responsive sizing
class TextStyles {
  /// Base text style that all other styles extend from
  static const TextStyle _baseStyle = TextStyle(
    fontFamily: AppFonts.degularDisplay,
    height: 1.2,
    letterSpacing: 0,
  );

  /// Determines responsive font size based on screen width
  static double _getResponsiveFontSize(double large, double small) {
    return SizeConfig.screenWidth! <= DeviceBreakpoint.smm.maxWidth ? small.sp : large.sp;
  }

  // ==== Display ====
  static TextStyle displayLarge = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(96, 72),
    fontWeight: FontWeight.bold,
  );

  static TextStyle displayMedium = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(60, 48),
    fontWeight: FontWeight.bold,
  );

  static TextStyle displaySmall = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(48, 36),
    fontWeight: FontWeight.bold,
  );

  // ==== Headline ====
  static TextStyle headlineLarge = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(40, 32),
    fontWeight: FontWeight.bold,
  );

  static TextStyle headlineMedium = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(34, 28),
    fontWeight: FontWeight.bold,
  );

  static TextStyle headlineSmall = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(28, 24),
    fontWeight: FontWeight.bold,
  );

  static TextStyle headlineSmaller = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(24, 20),
    fontWeight: FontWeight.bold,
  );

  static TextStyle headlineTiny = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(23, 19),
    fontWeight: FontWeight.normal,
  );

  // ==== Title ====
  static TextStyle titleLarger = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(20, 18),
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleLarge = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(18, 16),
    fontWeight: FontWeight.w400,
  );

  static TextStyle titleMedium = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(16, 14),
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleSmall = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(14, 12),
    fontWeight: FontWeight.w500,
  );

  // ==== Body ====
  static TextStyle bodyLarge = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(16, 14),
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyMedium = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(14, 12),
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodySmall = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(12, 10),
    fontWeight: FontWeight.normal,
  );

  // ==== Label ====
  static TextStyle labelLarge = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(14, 12),
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelMedium = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(12, 11),
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelSmall = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(10, 9),
    fontWeight: FontWeight.w500,
  );

  // ==== Misc Sizes ====
  static TextStyle extraLarge = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(72, 54),
    fontWeight: FontWeight.bold,
  );

  static TextStyle large = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(36, 28),
    fontWeight: FontWeight.bold,
  );

  static TextStyle medium = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(28, 22),
    fontWeight: FontWeight.normal,
  );

  static TextStyle small = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(16, 14),
    fontWeight: FontWeight.normal,
  );

  static TextStyle tiny = _baseStyle.copyWith(
    fontSize: _getResponsiveFontSize(8, 6),
    fontWeight: FontWeight.normal,
  );

  static TextStyle hidden = _baseStyle.copyWith(height: 0);
}

/// Defines reusable decoration styles including borders, border radii, and shadows.
class DecorationStyles {
  // ==== BorderRadius (All Sides) ====
  static BorderRadius get borderRadiusRoundedAllSides => BorderRadius.all(Radius.circular(Dimensions.borderRadius2));

  static BorderRadius get borderRadiusRoundedAllSides2 => BorderRadius.all(Radius.circular(Dimensions.borderRadius2_5));

  static BorderRadius get borderRadiusRoundedAllSides3 => BorderRadius.all(Radius.circular(Dimensions.borderRadius3));

  static BorderRadius get borderRadiusRoundedAllSides4 => BorderRadius.all(Radius.circular(Dimensions.borderRadius4));

  static BorderRadius get borderRadiusRoundedAllSides5 => BorderRadius.all(Radius.circular(Dimensions.borderRadius5));

  static BorderRadius get borderRadiusCircularAllSides => const BorderRadius.all(Radius.circular(3000));

  // ==== BorderRadius (Top Only) ====
  static BorderRadius get borderRadiusCircularOnlyTop1 =>
      BorderRadius.vertical(top: Radius.circular(Dimensions.borderRadius1));

  static BorderRadius get borderRadiusCircularOnlyTop =>
      BorderRadius.vertical(top: Radius.circular(Dimensions.borderRadius2));

  static BorderRadius get borderRadiusCircularOnlyTop3 =>
      BorderRadius.vertical(top: Radius.circular(Dimensions.borderRadius3));

  static BorderRadius get borderRadiusCircularOnlyTop4 =>
      BorderRadius.vertical(top: Radius.circular(Dimensions.borderRadius4));

  static BorderRadius get borderRadiusCircularOnlyTop5 =>
      BorderRadius.vertical(top: Radius.circular(Dimensions.borderRadius5));

  static BorderRadius get borderRadiusCircularOnlyTop6 =>
      BorderRadius.vertical(top: Radius.circular(Dimensions.borderRadius6));
}
