import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:niu_app/views/login_page.dart';

void main() {
  testWidgets('Test LoginScreen Widget', (WidgetTester tester) async {
    final container = ProviderContainer();
    await tester.pumpWidget(
      ProviderScope(
        parent: container,
        child: const MaterialApp(
          home: LoginScreen(),
        ),
      ),
    );
    expect(find.byType(LoginScreen), findsOneWidget);

    expect(find.byType(TextField), findsNWidgets(2));

    expect(find.text('Login'), findsOneWidget);

    container.dispose();
  });
}
