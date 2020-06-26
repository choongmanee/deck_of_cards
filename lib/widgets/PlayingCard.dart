import 'dart:math';

import 'package:deckofcards/models/DeckModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cardDetails.dart';

class PlayingCard extends StatelessWidget {
  final suit;
  final rank;
  final body;
  final bool up = false;

  PlayingCard({
    this.suit,
    this.rank,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.0025)
        ..rotateX(Provider.of<DeckModel>(context).angle),
      alignment: Alignment.center,
      child: (Provider.of<DeckModel>(context).angle <= pi / 2)
          ? Card(
              child: InkWell(
                splashColor: Colors.black87.withAlpha(30),
                onTap: () => {print('flip card')},
                child: CardDetails(
                  body: this.body,
                  rank: this.rank,
                  suit: this.suit,
                ),
              ),
            )
          : Container(
              color: Colors.black,
            ),
    );
  }
}
