import 'package:altech_ui_flutter/altech_ui_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Altech theme uses Material 3 and semantic extension', () {
    final theme = AltechTheme.light();
    expect(theme.useMaterial3, isTrue);
    expect(theme.extension<AltechSemanticColors>(), isNotNull);
  });

  testWidgets('AltechButton renders text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AltechTheme.light(),
        home: Scaffold(
          body: AltechButton(text: 'Login', onPressed: () {}),
        ),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('AltechTextField renders hint text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AltechTheme.light(),
        home: const Scaffold(body: AltechTextField(hintText: 'Masukkan email')),
      ),
    );

    expect(find.text('Masukkan email'), findsOneWidget);
  });
}
