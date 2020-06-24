import 'package:deckofcards/widgets/cardBody.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
}
