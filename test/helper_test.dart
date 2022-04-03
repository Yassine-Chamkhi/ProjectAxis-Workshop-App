// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_axis_app/services/http_helper.dart';

void main() {
  test('Testing trivia', () async {
    HttpHelper helper = HttpHelper();
    await helper.getTrivia(42);
    expect(helper.trivia.startsWith("42"), true);
  });
}
