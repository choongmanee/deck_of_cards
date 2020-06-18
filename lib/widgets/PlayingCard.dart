import 'package:flutter/material.dart';

import 'cardDetails.dart';

class PlayingCard extends StatelessWidget {
  final suite;
  final rank;
  final body;
  final bool up = false;

  PlayingCard({
    this.suite,
    this.rank,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.black87.withAlpha(30),
        onTap: () => {print('flip card')},
        child: CardDetails(
          body: this.body,
          rank: this.rank,
          suite: this.suite,
        ),
      ),
    );
  }
}
