// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:xtools/main.dart';

void main() {
  testWidgets('Profit route test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(XToolApp());

    await tester.tap(find.byIcon(FontAwesomeIcons.dollarSign));
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.text('计算收益'), findsOneWidget);
  });
}
