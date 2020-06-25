import 'package:deckofcards/widgets/cardCorner.dart';
import 'package:flutter/material.dart';

import 'cardBody.dart';

class CardDetails extends StatelessWidget {
  final String suit;
  final String rank;
  final CardBody body;

  CardDetails({this.suit, this.rank, this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CardCorner(
            rank: this.rank,
            suit: this.suit,
            isBottom: false,
          ),
          Expanded(
            child: this.body,
          ),
          CardCorner(
            rank: this.rank,
            suit: this.suit,
            isBottom: true,
          ),
        ],
      ),
    );
  }
}
