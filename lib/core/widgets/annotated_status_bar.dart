import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rivy/core/constants/colors.dart';

class AnnotatedStatusBar extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Brightness? brightness;

  const AnnotatedStatusBar({
    super.key,
    required this.child,
    this.color,
    this.brightness = Brightness.light,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color ?? AppColor.background,
        statusBarBrightness: brightness, // For iOS
        statusBarIconBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light, // For Android
        systemNavigationBarColor: AppColor.background,
        systemNavigationBarIconBrightness: brightness,
      ),
      child: child,
    );
  }
}
