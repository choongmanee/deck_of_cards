import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'cardDetails.dart';

class PlayingCard extends StatelessWidget {
  final suite;
  final rank;
  final body;

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
        onTap: () => {
          print(math.Random().nextInt(14).toRadixString(16).toUpperCase()),
        },
        child: CardDetails(
          body: this.body,
          rank: this.rank,
          suite: this.suite,
        ),
      ),
    );
  }
}
