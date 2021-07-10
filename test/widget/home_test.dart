// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:falcon106/helpers/dependency_assembly.dart';
import 'package:falcon106/ui/views/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_helpers.dart';

Widget createHomeScreen() => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListView(),
    );

void main() {
  group('Home Page Widget Tests', () {
    setupDependencyAssembler();

    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    testWidgets('Verify app bar title', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('ShopNBuy'), findsOneWidget);
    });

    testWidgets('Verify cart icon and progress indicator loads',
        (tester) async {
      await tester.pumpWidget(createHomeScreen());
      final circularProgressIndicator = find.byType(CircularProgressIndicator);
      final icon = find.byType(Icon);

      expect(circularProgressIndicator, findsOneWidget);
      expect(icon, findsOneWidget);
    });
  });
}
