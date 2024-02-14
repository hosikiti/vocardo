import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vocardo/core/widget/elapsed_time_widget.dart';

void main() {
  group('Elapsed Time Widget', () {
    Widget makeTestableWidget(int elapsedInSec) {
      return MaterialApp(
          home: Scaffold(body: ElapsedTime(elapsedInSec: elapsedInSec)));
    }

    testWidgets(
        'should display correct elapsed time when the given second is less than 10 seconds',
        (WidgetTester tester) async {
      // Arrange
      final widget = makeTestableWidget(9);

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.text('00:09'), findsOneWidget);
    });

    testWidgets(
        'should display correct elapsed time when given second is less than 60 seconds',
        (WidgetTester tester) async {
      // Arrange
      final widget = makeTestableWidget(59);

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.text('00:59'), findsOneWidget);
    });

    testWidgets(
        'should display correct elapsed time when given second is more than 60 seconds',
        (WidgetTester tester) async {
      // Arrange
      final widget = makeTestableWidget(61);

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.text('01:01'), findsOneWidget);
    });

    testWidgets(
        'should display correct elapsed time when given second is 3599 seconds',
        (WidgetTester tester) async {
      // Arrange
      final widget = makeTestableWidget(3599);

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.text('59:59'), findsOneWidget);
    });

    testWidgets(
        'should display correct elapsed time when given second is more than 100 minutes',
        (WidgetTester tester) async {
      // Arrange
      final widget = makeTestableWidget(3600);

      // Act
      await tester.pumpWidget(widget);

      // Assert
      expect(find.text('--:--'), findsOneWidget);
    });
  });
}
