import 'package:app/app_wid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('desc', (WidgetTester tester) async {
    await tester.pumpWidget(const Myself('Axiy', 22));

    final Finder text = find.text('Axi'); //!text widgetda
    final Finder age = find.text('22');

    await tester.tap(text);
    await tester.pump();

    ///find.byWidget(Widget)
    ///expect(find.byType(IconButton),    findsWidgets);
    final Finder byKey = find.byKey(const Key('hello'));
    expect(text, findsWidgets);
    expect(age, findsOneWidget);
    expect(byKey, findsOneWidget);
  });
}
