import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ultimate_finance_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login test', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Inicio'), findsOneWidget);

    final loginButton = find.widgetWithText(ElevatedButton, 'Iniciar sesion');

    expect(loginButton, findsOneWidget);

    final emailField = find.byType(TextFormField).first;
    final passwordField = find.byType(TextFormField).last;

    await tester.enterText(emailField, 'a.hurtado.bo@gmail.com');
    await tester.enterText(passwordField, 'Canuto7000');

    await tester.tap(loginButton);
    await tester.pumpAndSettle(const Duration(seconds: 5));
  });
}
