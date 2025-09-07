import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rivy/core/widgets/app_button.dart';
import 'package:rivy/core/widgets/size_config_provider.dart';

void main() {
  testWidgets('renders text', (tester) async {
    await tester.pumpWidget(
      const SizeConfigProvider(
        child: MaterialApp(
          home: Scaffold(
            body: AppButton(text: 'Press me'),
          ),
        ),
      ),
    );

    expect(find.text('Press me'), findsOneWidget);
  });

  testWidgets('calls onTap when tapped', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      SizeConfigProvider(
        child: MaterialApp(
          home: Scaffold(
            body: AppButton(
              text: 'Tap me',
              onTap: () => tapped = true,
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(AppButton));
    await tester.pump();

    expect(tapped, isTrue);
  });

  testWidgets('does not call onTap when showLoader = true', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      SizeConfigProvider(
        child: MaterialApp(
          home: Scaffold(
            body: AppButton(
              text: 'Tap me',
              showLoader: true,
              onTap: () => tapped = true,
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(AppButton));
    await tester.pump();

    expect(tapped, isFalse);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders border when isOnlyBorder = true', (tester) async {
    await tester.pumpWidget(
      const SizeConfigProvider(
        child: MaterialApp(
          home: Scaffold(
            body: AppButton(
              text: 'Border',
              isOnlyBorder: true,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Border'), findsOneWidget);
  });
}
