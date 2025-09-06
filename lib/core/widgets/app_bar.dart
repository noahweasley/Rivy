import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rivy/core/constants/app_style.dart';
import 'package:rivy/core/constants/colors.dart';
import 'package:rivy/core/constants/dimensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final Brightness? brightness;
  final bool? centerTitle;
  final Widget? leadingIcon;
  final Color? leadingIconBackgroundColor;
  final bool? navigateToExit;
  final Color? navigationBarColor;
  final bool noTitle;
  final VoidCallback? onNavigateUp;
  final Color? statusBarColor;
  final Widget? title;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    this.leadingIcon,
    this.title,
    this.noTitle = false,
    this.centerTitle = true,
    this.bottom,
    this.actions,
    this.backgroundColor,
    this.onNavigateUp,
    this.navigateToExit = false,
    this.automaticallyImplyLeading = true,
    this.navigationBarColor,
    this.statusBarColor,
    this.brightness = Brightness.light,
    this.leadingIconBackgroundColor,
    this.leading,
  });

  @override
  Size get preferredSize {
    final height = bottom != null ? bottom!.preferredSize.height + Dimensions.toolbarHeight : Dimensions.toolbarHeight;
    return Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    final showLeading = automaticallyImplyLeading || (navigateToExit ?? false);

    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.space1,
        right: Dimensions.space1,
        bottom: Dimensions.space1,
      ),
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: statusBarColor ?? AppColor.background,
          statusBarBrightness: brightness, // For iOS
          statusBarIconBrightness: brightness == Brightness.light ? Brightness.dark : Brightness.light, // For Android
          systemNavigationBarColor: navigationBarColor ?? AppColor.background,
          systemNavigationBarIconBrightness: brightness,
        ),
        actions: actions,
        scrolledUnderElevation: 0,
        backgroundColor: backgroundColor ?? Colors.transparent,
        bottom: bottom,
        elevation: 0,
        automaticallyImplyLeading: false, // Always false; we handle it manually
        leading: showLeading ? _buildNavigateUpIcon(context) : null,
        centerTitle: centerTitle,
        title: title,
      ),
    );
  }

  Widget? _buildNavigateUpIcon(BuildContext context) {
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
    final shouldExit = (navigateToExit ?? false) && !isIOS;
    // On iOS: If navigateToExit is true, disable the back button
    if (isIOS && (navigateToExit ?? false)) return null;

    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: DecorationStyles.borderRadiusCircularAllSides,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: DecorationStyles.borderRadiusCircularAllSides,
          color: leadingIconBackgroundColor ?? AppColor.snowWhite,
        ),
        child: InkWell(
          onTap: () {
            if (shouldExit) {
              SystemNavigator.pop();
            } else {
              (onNavigateUp ?? Navigator.of(context).pop)();
            }
          },
          customBorder: const CircleBorder(),
          child: leading ??
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: leadingIcon ??
                      const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 24,
                        color: AppColor.charcoalGrey,
                      ),
                ),
              ),
        ),
      ),
    );
  }
}
