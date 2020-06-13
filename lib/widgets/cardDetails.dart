import 'package:deckofcards/widgets/cardCorner.dart';
import 'package:flutter/material.dart';

import 'cardBody.dart';

class CardDetails extends StatelessWidget {
  final String suite;
  final String rank;
  final int left;
  final int center;
  final int right;

  CardDetails({this.suite, this.rank, this.left, this.center, this.right});

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
          CardBody(
            left: this.left,
            center: this.center,
            right: this.right,
            suite: this.suite,
          ),
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
