import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rivy/core/constants/app_theme.dart';
import 'package:rivy/core/widgets/size_config_provider.dart';
import 'package:rivy/features/onboarding/domain/onboarding_bloc.dart';
import 'package:rivy/features/onboarding/screens/onboarding_screen.dart';
import 'package:rivy/l10n/gen/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../util.dart';

void main() {
  testWidgets('OnboardingScreen shows items and navigates with Next button', (WidgetTester tester) async {
    initializeScreen(tester);

    await tester.pumpWidget(
      SizeConfigProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.getTheme(Themes.darkThemeCode),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider(
            create: (_) => OnboardingBloc(),
            child: const OnboardingScreen(),
          ),
        ),
      ),
    );

    expect(
      find.text('Finance to Power Your Home or Business'),
      findsOneWidget,
    );

    expect(find.byType(AnimatedSmoothIndicator), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(
      find.text('Buy Solar Product at Best Prices'),
      findsOneWidget,
    );
  });
}
