import 'package:rivy/core/utilities/size/size_config.dart';

class Dimensions {
  static final double _borderRadius1 = 8;
  static final double _borderRadius2 = 10;
  static final double _borderRadius2_5 = 12;
  static final double _borderRadius3 = 14;
  static final double _borderRadius4 = 16;
  static final double _borderRadius5 = 24;
  static final double _borderRadius6 = 32;
  static final double _iconSize = 24;
  static final double _iconSize2 = 32;
  static final double _minSpace = 4;
  static final double _space1 = 8;
  static final double _space2 = 10;
  static final double _space3 = 16;
  static final double _space4 = 24;
  static final double _space5 = 32;
  static final double _space6 = 40;
  static final double _space7 = 48;
  static final double _space8 = 56;
  static final double _toolbarHeight = 56;

  static double get toolbarHeight => _scale(_toolbarHeight);

  static double get borderRadius1 => _scale(_borderRadius1);

  static double get borderRadius2 => _scale(_borderRadius2);

  static double get borderRadius2_5 => _scale(_borderRadius2_5);

  static double get borderRadius3 => _scale(_borderRadius3);

  static double get borderRadius4 => _scale(_borderRadius4);

  static double get borderRadius5 => _scale(_borderRadius5);

  static double get borderRadius6 => _scale(_borderRadius6);

  static double get minSpace => _scale(_minSpace);

  static double get space1 => _scale(_space1);

  static double get space2 => _scale(_space2);

  static double get space3 => _scale(_space3);

  static double get space4 => _scale(_space4);

  static double get space5 => _scale(_space5);

  static double get space6 => _scale(_space6);

  static double get space7 => _scale(_space7);

  static double get space8 => _scale(_space8);

  static double get iconSize => _scale(_iconSize);

  static double get iconSize2 => _scale(_iconSize2);

  static double _scale([double factor = 1.0]) {
    final width = SizeConfig.screenWidth ?? 750;

    if (width <= DeviceBreakpoint.smm.maxWidth) {
      return factor * 0.85;
    } else if (width <= DeviceBreakpoint.md.maxWidth) {
      return factor * 0.95;
    } else if (width <= DeviceBreakpoint.lg.maxWidth) {
      return factor * 1.0;
    } else if (width <= DeviceBreakpoint.xxl.maxWidth) {
      return factor * 1.05;
    } else if (width <= DeviceBreakpoint.xxxxl.maxWidth) {
      return factor * 1.1;
    } else if (width <= DeviceBreakpoint.ultra.maxWidth) {
      return factor * 1.15;
    }

    return factor;
  }
}
