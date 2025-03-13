// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/todo_app.dart' as todo_app; // Use alias to avoid naming conflict



import 'package:to_do_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp()); // Removed 'const' from the constructor invocation


    // Verify that our counter starts at 0.
    // Verify that the app title is displayed
    expect(find.text('To-Do App'), findsOneWidget);

  });
}
