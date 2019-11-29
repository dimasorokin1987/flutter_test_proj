// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:web_proj/main.dart';

void main() {
  testWidgets('Text presence and color changing smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MainWidget());

    // Check text exist.
    expect(find.text('Hey there'), findsOneWidget);

    // Remember current color.
    Finder finder = find.byType(Scaffold);
    Scaffold el = finder.evaluate().single.widget as Scaffold;
    Color prevColor = el.backgroundColor;

    // Tap and trigger a frame.
    await tester.tap(find.byType(InkWell));
    await tester.pump();

    // Verify that color has changed.
    finder = find.byType(Scaffold);
    el = finder.evaluate().single.widget as Scaffold;
    expect(el.backgroundColor, isNot(equals(prevColor)));
  });
}