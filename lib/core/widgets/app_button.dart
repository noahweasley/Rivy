import 'package:flutter/material.dart';
import 'package:rivy/core/constants/app_style.dart';
import 'package:rivy/core/constants/colors.dart';
import 'package:rivy/core/constants/dimensions.dart';
import 'package:rivy/core/widgets/platform_loader.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final double? height;
  final double? width;
  final String text;
  final Color textColor;
  final bool hasBorder;
  final Color borderColor;
  final double? fontSize;
  final Widget? child;
  final Widget? icon;
  final bool showLoader;
  final bool isOnlyBorder;

  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.icon,
    this.height,
    this.width,
    this.child,
    this.borderColor = Colors.black,
    this.textColor = Colors.white,
    this.fontSize = 17,
    this.hasBorder = false,
    this.showLoader = false,
    this.isOnlyBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: height ?? 56,
      child: Material(
        color: Colors.transparent,
        borderRadius: DecorationStyles.borderRadiusRoundedAllSides,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Ink(
          decoration: !isOnlyBorder
              ? BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.borderRadius3),
                  ),
                )
              : BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Dimensions.borderRadius3),
                  ),
                ),
          child: InkWell(
            onTap: onTap != null ? (showLoader ? null : onTap) : null,
            customBorder: RoundedRectangleBorder(
              side: hasBorder ? BorderSide(color: borderColor) : BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.borderRadius3),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.space1),
              child: Center(
                child: showLoader
                    ? const PlatformLoader(size: 20)
                    : Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyles.small.copyWith(
                          color: (isOnlyBorder) ? Colors.black : textColor,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
