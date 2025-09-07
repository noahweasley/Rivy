import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rivy/core/constants/app_theme.dart';
import 'package:rivy/core/widgets/size_config_provider.dart';
import 'package:rivy/features/onboarding/domain/onboarding_bloc.dart';
import 'package:rivy/features/onboarding/screens/onboarding_screen.dart';
import 'package:rivy/features/splash/screens/splash_screen.dart';
import 'package:rivy/l10n/gen/app_localizations.dart';

import '../util.dart';

void main() {
  testWidgets(
    'SplashScreen shows logo and navigates to OnboardingScreen',
    (WidgetTester tester) async {
      initializeScreen(tester);

      await tester.pumpWidget(
        SizeConfigProvider(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Themes.getTheme(Themes.darkThemeCode),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const SplashScreen(),
          ),
        ),
      );

      expect(
        find.svgAssetWithPath('assets/svg/rivy-full.svg'),
        findsOneWidget,
      );

      expect(find.text('@2025. All right reserved. v3.7.1'), findsOneWidget);

      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      expect(find.byType(OnboardingScreen), findsOneWidget);

      final blocProviders = tester.widgetList<BlocProvider<OnboardingBloc>>(
        find.byType(BlocProvider<OnboardingBloc>),
      );

      expect(blocProviders.isNotEmpty, true);
    },
  );
}
