import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rivy/core/constants/app_style.dart';
import 'package:rivy/core/constants/assets.dart';
import 'package:rivy/core/constants/colors.dart';
import 'package:rivy/core/constants/dimensions.dart';
import 'package:rivy/core/widgets/annotated_status_bar.dart';
import 'package:rivy/features/onboarding/domain/onboarding_bloc.dart';
import 'package:rivy/features/onboarding/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) => BlocProvider(
            create: (_) => OnboardingBloc(),
            child: const OnboardingScreen(),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedStatusBar(
      color: AppColor.rivyGreen,
      brightness: Brightness.light,
      child: Scaffold(
        backgroundColor: AppColor.rivyGreen,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    VectorAssets.rivyFull,
                    height: 50,
                  ),
                ),
                Text(
                  '@2025. All right reserved. v3.7.1',
                  style: TextStyles.bodyMedium,
                ),
                SizedBox(height: Dimensions.space1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
