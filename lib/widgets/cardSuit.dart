import 'package:flutter/material.dart';

class CardSuit extends StatelessWidget {
  const CardSuit({
    @required this.suit,
  });

  final String suit;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.suit,
      style: TextStyle(
        fontSize: 36.0,
        color: this.suit == '\u2666' || this.suit == '\u2665'
            ? Colors.red
            : Colors.black,
      ),
      textDirection: TextDirection.ltr,
    );
  }
}
