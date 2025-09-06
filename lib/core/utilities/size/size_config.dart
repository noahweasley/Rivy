import 'package:flutter/cupertino.dart';

enum DeviceBreakpoint {
  xs(0, 280),
  sm(280, 320),
  smm(320, 360),
  md(360, 390),
  mdl(390, 414),
  lg(414, 450),
  xl(450, 600),
  xxl(600, 768),
  xxxl(768, 1024),
  xxxxl(1024, 1440),
  ultra(1440, 3000);

  final int maxWidth;
  final int minWidth;

  const DeviceBreakpoint(this.minWidth, this.maxWidth);
}

class SizeConfig {
  static BuildContext? appContext;
  static double? aspectRatio;
  static double? devicePixelRatio;
  static double? screenHeight;
  static double? screenWidth;
  static TextScaler? textScaler;
  static MediaQueryData? _mediaQueryData;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    appContext = context;
    screenHeight = _mediaQueryData!.size.height;
    screenWidth = _mediaQueryData!.size.width;
    devicePixelRatio = _mediaQueryData!.devicePixelRatio;
    aspectRatio = _mediaQueryData!.size.aspectRatio;
    textScaler = _mediaQueryData!.textScaler;

    //  log(
    //    'SizeConfig Initialized\n'
    //    ' ├─ Screen Width:  ${screenWidth} px\n'
    //    ' ├─ Screen Height: ${screenHeight} px\n'
    //    ' ├─ Pixel Ratio:   ${devicePixelRatio}\n'
    //    ' ├─ Aspect Ratio:  ${aspectRatio}\n'
    //    // ignore: deprecated_member_use
    //    ' └─ Text Scale:    ${textScaler?.textScaleFactor}',
    //  );
  }

  static double getHeight(double height) {
    return _mediaQueryData!.size.height * (height / 844);
  }

  static double getWidth(double width) {
    return _mediaQueryData!.size.width * (width / 390);
  }

  static double getTextSize(double textSize) {
    return _mediaQueryData!.size.width * (textSize / 414);
  }

  static bool get isSmallScreen => screenWidth != null && screenWidth! <= 600;

  static bool get isSmallerScreen => screenWidth != null && screenWidth! <= 400;

  static bool get isMediumScreen => screenWidth != null && screenWidth! > 600 && screenWidth! <= 1024;

  static bool get isLargeScreen => screenWidth != null && screenWidth! > 1024;
}
