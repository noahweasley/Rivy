import 'package:flutter/material.dart';
import 'package:rivy/core/constants/app_theme.dart';
import 'package:rivy/core/widgets/size_config_provider.dart';
import 'package:rivy/features/splash/screens/splash_screen.dart';
import 'package:rivy/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeConfigProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.getTheme(Themes.darkThemeCode),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SplashScreen(),
      ),
    );
  }
}
