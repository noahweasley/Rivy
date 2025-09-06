import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rivy/core/constants/colors.dart';
import 'package:rivy/core/constants/ints.dart';

class PlatformLoader extends StatelessWidget {
  final double size;
  final Color color;

  const PlatformLoader({
    super.key,
    this.size = 50,
    this.color = AppColor.background,
  });

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return Center(
        child: SizedBox(
          width: size,
          height: size,
          child: CupertinoTheme(
            data: CupertinoThemeData(brightness: Brightness.light, primaryColor: color),
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: Ints.animationDurationShort),
              child: CupertinoActivityIndicator(
                radius: size / 2.5,
                color: color,
              ),
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            strokeWidth: 3.5,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      );
    }
  }
}
