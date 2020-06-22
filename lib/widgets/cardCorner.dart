import 'package:flutter/material.dart';

enum location { top, bottom }

class CardCorner extends StatelessWidget {
  final String rank;
  final String suit;
  final bool isBottom;

  CardCorner({this.rank, this.suit, this.isBottom});

  @override
  Widget build(BuildContext context) {
    Widget corner = Container(
      width: 48.0,
      padding: EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            this.rank,
            style: TextStyle(
                fontSize: 24.0,
                color: this.suit == '\u2666' || this.suit == '\u2665'
                    ? Colors.red
                    : Colors.black),
          ),
          Text(
            this.suit,
            style: TextStyle(
                fontSize: 24.0,
                color: this.suit == '\u2666' || this.suit == '\u2665'
                    ? Colors.red
                    : Colors.black),
          ),
        ],
      ),
    );

    if (this.isBottom) {
      corner = RotatedBox(
        quarterTurns: 2,
        child: corner,
      );
    }

    return corner;
  }
}
