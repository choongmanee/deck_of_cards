import 'package:deckofcards/widgets/cardBody.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CardBody widget', () {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(CardBody(
        sides: 2,
        center: 1,
        suit: '\u2660',
        centerGap: true,
        rank: '5',
      ));

//      expect(find.byType(Expanded), findsOneWidget);
      expect(find.text('\u2660'), findsNWidgets(5));
    });
  });

  group('isFaceCard', () {
    test('CardBody should be a number card', () {
      final cardBody = CardBody(
        sides: 0,
        center: 1,
      );

      expect(cardBody.isFaceCard(), false);
    });

    test('CardBody should be a face card', () {
      final cardBody = CardBody(
        sides: 5,
        center: 6,
      );

      expect(cardBody.isFaceCard(), true);
    });
  });
}
