import 'dart:math' as math;

import 'package:deckofcards/widgets/cardDetails.dart';
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
//    'J': [5, 5, 5],
//    'Q': [6, 6, 6],
//    'K': [7, 7, 7],
  };

  final suites = ['\u2660', '\u2663', '\u2665', '\u2666'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: List.generate(
            ranks.keys.toList().length,
            (rIndex) {
              String rank = ranks.keys.toList()[rIndex];
              int left = ranks[rank][0];
              int center = ranks[rank][1];
              int right = ranks[rank][2];

              return Row(
                children: List.generate(
                  suites.length,
                  (suite) => PlayingCard(
                    suite: suites[suite],
                    rank: rank,
                    left: left,
                    center: center,
                    right: right,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PlayingCard extends StatelessWidget {
  final suite;
  final rank;
  final left;
  final center;
  final right;

  PlayingCard({this.suite, this.rank, this.left, this.center, this.right});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.black87.withAlpha(30),
        onTap: () => {
          print(math.Random().nextInt(14).toRadixString(16).toUpperCase()),
        },
        child: CardDetails(
          suite: this.suite,
          rank: this.rank,
          left: this.left,
          center: this.center,
          right: this.right,
        ),
      ),
    );
  }
}
