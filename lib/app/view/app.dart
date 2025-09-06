import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rivy/core/widgets/size_config_provider.dart';
import 'package:rivy/features/onboarding/domain/bloc.dart';
import 'package:rivy/features/onboarding/screens/onboarding_screen.dart';
import 'package:rivy/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeConfigProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: BlocProvider(
          create: (_) => OnboardingBloc(),
          child: const OnboardingScreen(),
        ),
      ),
    );
  }
}
