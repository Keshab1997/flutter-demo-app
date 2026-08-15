import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_demo_app/main.dart';

void main() {
  testWidgets('counter increases after tapping the button', (tester) async {
    await tester.pumpWidget(const DemoApp());

    expect(find.text('0 বার'), findsOneWidget);
    await tester.tap(find.byKey(const Key('counterButton')));
    await tester.pump();
    expect(find.text('1 বার'), findsOneWidget);
  });

  testWidgets('a new task can be added', (tester) async {
    await tester.pumpWidget(const DemoApp());

    await tester.enterText(
      find.byKey(const Key('taskInput')),
      'Demo পরীক্ষা করা',
    );
    await tester.tap(find.byKey(const Key('addTaskButton')));
    await tester.pump();

    expect(find.text('Demo পরীক্ষা করা'), findsOneWidget);
  });
}
