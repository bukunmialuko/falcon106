import 'package:falcon106/helpers/dependency_assembly.dart';
import 'package:falcon106/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('Testing App Performance Tests', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    setupDependencyAssembler();

    testWidgets(
      'Scrolling test',
      (tester) async {
        await tester.pumpWidget(ShopNBuyApp());

        final listFinder = find.byType(ListView);

        await tester.pump(Duration(seconds: 10));
        await binding.watchPerformance(() async {
          await tester.fling(listFinder, Offset(0, -500), 10000);
          await tester.pumpAndSettle();

          await tester.fling(listFinder, Offset(0, 500), 10000);
          await tester.pumpAndSettle();
        }, reportKey: 'scrolling_summary');
      },
    );

    testWidgets(
      'Cart operations test',
      (tester) async {
        await tester.pumpWidget(ShopNBuyApp());

        await tester.pump(Duration(seconds: 10));

        final cardKeys = [
          'card_0',
          'card_1',
          'card_2',
        ];

        for (int i = 0; i < cardKeys.length; i++) {
          final card = cardKeys[i];
          await tester.tap(find.byKey(ValueKey(card)));
          await tester.pumpAndSettle(Duration(seconds: 1));

          var text = i + 1;
          expect(find.text(text.toString()), findsOneWidget);
        }
      },
    );
  });
}
