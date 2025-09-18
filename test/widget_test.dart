import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_application/features/color_changer/presentation/pages/my_home_page.dart';
import 'package:test_application/features/color_changer/presentation/utils/color_utils.dart';

void main() {
  testWidgets('it renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: MyHomePage(title: 'Test Application')),
    );

    await tester.pumpAndSettle();

    expect(find.text('Hello there'), findsOneWidget);
    expect(find.text('#FFFFFF'), findsOneWidget);
  });

  test('hexFromColor should return correct hex string', () {
    expect(ColorUtils.hexFromColor(const Color(0xFFFF0000)), 'FF0000'); // red
    expect(ColorUtils.hexFromColor(const Color(0xFF00FF00)), '00FF00'); // green
    expect(ColorUtils.hexFromColor(const Color(0xFF0000FF)), '0000FF'); // blue
  });
}
