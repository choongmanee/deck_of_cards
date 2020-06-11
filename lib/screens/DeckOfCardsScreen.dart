import 'dart:math' as math;

import 'package:deckofcards/widgets/cardTemplate.dart';
import 'package:flutter/material.dart';

class DeckOfCardsScreen extends StatelessWidget {
  final List<String> chars = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'A',
    'B',
    'C',
    'D'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: InkWell(
            splashColor: Colors.black87.withAlpha(30),
            onTap: () => {
              print(math.Random().nextInt(14).toRadixString(16).toUpperCase()),
            },
            child: CartTemplate(),
          ),
        ),
      ),
    );
  }
}
