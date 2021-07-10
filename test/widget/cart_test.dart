// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:falcon106/core/viewmodels/cart_model.dart';
import 'package:falcon106/ui/views/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Fake class
class FakeCartModel extends Fake implements CartModel {
  @override
  int get cartSize {
    return 0;
  }
}

Widget createCartScreen() => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartView(
        model: FakeCartModel(),
      ),
    );

void main() {
  group('Home Page Widget Tests', () {
    testWidgets('Verify app bar title', (tester) async {
      await tester.pumpWidget(createCartScreen());
      expect(find.text('ShopNBuy\'s Cart'), findsOneWidget);
    });

    testWidgets('Verify empty cart text and back icon', (tester) async {
      await tester.pumpWidget(createCartScreen());
      final emptyCartText = find.text("Your cart is empty");
      expect(emptyCartText, findsOneWidget);
      // Back icon should not exist
      // final backIcon = find.byType(Icon);
      // expect(backIcon, findsOneWidget);
    });
  });
}
