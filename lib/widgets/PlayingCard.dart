import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        Container(),
        Card(
          child: InkWell(
            splashColor: Colors.black87.withAlpha(30),
            onTap: () => {print('flip card')},
            child: CardDetails(
              body: this.body,
              rank: this.rank,
              suit: this.suit,
            ),
          ),
        ),
      ],
    );
  }
}
