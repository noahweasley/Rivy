<p align="center">
  <img src="android/app/src/main/res/mipmap-xxxhdpi/ic_launcher_round.webp" alt="Rivy Logo" width="120" height="120" />
</p>
<h1 align="center">Rivy</h1>

<p align="center">
  <img src="coverage_badge.svg" alt="Coverage Badge" />
  <img src="https://img.shields.io/badge/Flutter-3.32-blue?logo=flutter&logoColor=white" alt="Flutter Version" />
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-009688?logo=android&logoColor=white&color=009688" alt="Platform" />
  <img src="https://img.shields.io/badge/Style-Very%20Good%20CLI-purple?logo=very-good&logoColor=white" alt="Very Good CLI" />
  <img src="https://img.shields.io/badge/Support-Android%205.0%2B%20%7C%20iOS%2013.0%2B-informational?logo=google-play&logoColor=white" alt="Supported OS Versions" />

</p>

<p align="center">
  A redesign of the Rivy's onboarding screens
</p>

---

## Getting Started

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Rivy works on iOS, Android, Web, and Windows._

### Prerequisites

- **Flutter SDK**: Install the latest stable version (SDK >=3.0.5 <4.0.0).
- **Android Tools**: Ensure Android Studio, Android command line tools, and target SDK API 34 are installed.
- **Dart**: Comes bundled with Flutter SDK.
- **IDE**: Any Flutter-supported IDE such as VSCode or Android Studio.

### Installation

```sh
# Clone the repository
git clone https://github.com/noahweasley/Rivy.git

# Navigate to project directory
cd rivy

# Fetch dependencies
flutter pub get
```

---

## Running the App

To run the application in debug mode on an emulator or connected device:

```sh
flutter run --flavor development --target lib/main_development.dart
```

---

## Running Tests

To run all unit and widget tests use the following command:

```sh
$ very_good test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Building the App

### Android

To build for Android without splitting the ABIs:

```sh
flutter build apk --flavor production --target lib/main_production.dart
```

To build for Android with ABI split:

```sh
flutter build apk --split-per-abi --flavor production --target lib/main_production.dart
```

⚠️ Ensure a stable internet connection as Gradle and other dependencies may be downloaded during the build.

---

## Architecture

Rivy follows the **Very Good CLI** structure, integrated with Flutter best practices. State management and architecture patterns ensure scalability and maintainability.

---

## SDKs & Libraries

- **flutter_bloc** → State management
- **equatable** → Value equality
- **flutter_svg** → Persistence for bloc state
- **intl** → Internationalization utilities
- **very_good_analysis** → Linting rules

---

## Working with Translations

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description.

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

### Generating Translations

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

---

## Conclusion

This README provides setup instructions, build commands, testing info, and architecture insights for the Rivy App.

---

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
