import 'dart:math';

import 'package:deckofcards/models/CardModel.dart';
import 'package:deckofcards/models/DeckModel.dart';
import 'package:deckofcards/widgets/cardBody.dart';
import 'package:deckofcards/widgets/cardDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayingCard extends StatelessWidget {
  final CardModel card;
  final double radians;
  final Function flip;

  PlayingCard({this.card, this.radians, this.flip});

  @override
  Widget build(BuildContext context) {
    DeckModel deck = Provider.of<DeckModel>(context);

    return GestureDetector(
      onTap: () {
        this.card.flip();
        this.flip();

        deck.update(this.card);
      },
      child: LimitedBox(
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0025)
            ..rotateX(this.radians),
          alignment: Alignment.center,
          child: this.radians < (pi / 2)
              ? Card(
                  child: InkWell(
                    splashColor: Colors.black87.withAlpha(30),
                    child: CardDetails(
                      body: CardBody(
                        sides: this.card.sides,
                        center: this.card.center,
                        suit: this.card.suitCode,
                        centerGap: this.card.centerGap,
                        rank: this.card.rank,
                      ),
                      rank: this.card.rank,
                      suit: this.card.suitCode,
                    ),
                  ),
                )
              : Card(
                  child: Container(
                    color: Colors.black,
                  ),
                ),
        ),
      ),
    );
  }
}
