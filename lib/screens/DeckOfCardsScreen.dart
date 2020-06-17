import 'package:deckofcards/widgets/PlayingCard.dart';
import 'package:deckofcards/widgets/cardBody.dart';
import 'package:flutter/material.dart';

class DeckOfCardsScreen extends StatelessWidget {
  final ranks = {
    'A': [0, 1, 0],
    '2': [0, 2, 0],
    '3': [0, 3, 0],
    '4': [2, 0, 2],
    '5': [2, 1, 2],
    '6': [3, 0, 3],
    '7': [3, 1, 3],
    '8': [3, 2, 3],
    '9': [4, 1, 4],
    '10': [4, 2, 4],
    'J': [5, 5, 5],
    'Q': [6, 6, 6],
    'K': [7, 7, 7],
  };

  final suites = ['\u2660', '\u2663', '\u2666', '\u2665'];

  List<Widget> listCards() {
    return List.generate(
      ranks.keys.toList().length,
      (rIndex) {
        String rank = ranks.keys.toList()[rIndex];
        int left = ranks[rank][0];
        int center = ranks[rank][1];
        int right = ranks[rank][2];

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            suites.length,
            (suite) => PlayingCard(
              suite: suites[suite],
              rank: rank,
              body: CardBody(
                left: left,
                center: center,
                right: right,
                centerGap: (rank == '7' || rank == '9'),
                suite: suites[suite],
                rank: rank,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 992.0,
            child: ListView(
              children: listCards(),
            ),
          ),
        ),
      ),
    );
  }
}
