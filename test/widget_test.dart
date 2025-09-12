import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_application/myHomePage.dart';

void main() {
  testWidgets('it renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: MyHomePage(title: 'Test Application')),
    );

    await tester.pumpAndSettle();

    expect(find.text('Hello there'), findsOneWidget);
    expect(find.text('#ffffff'), findsOneWidget);
  });
}
