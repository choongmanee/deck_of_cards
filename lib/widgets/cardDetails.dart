import 'package:deckofcards/widgets/cardCorner.dart';
import 'package:flutter/material.dart';

import 'cardBody.dart';

class CardDetails extends StatelessWidget {
  final String suite;
  final String rank;
  final CardBody body;

  CardDetails({this.suite, this.rank, this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CardCorner(
            rank: this.rank,
            suite: this.suite,
            isBottom: false,
          ),
          this.body,
          CardCorner(
            rank: this.rank,
            suite: this.suite,
            isBottom: true,
          ),
        ],
      ),
      width: 250.0,
      height: 350.0,
    );
  }
}
