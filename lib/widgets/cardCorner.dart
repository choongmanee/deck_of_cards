import 'package:flutter/material.dart';

enum location { top, bottom }

class CardCorner extends StatelessWidget {
  final String rank;
  final String suite;
  final bool isBottom;

  CardCorner({this.rank, this.suite, this.isBottom});

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
            ),
          ),
          Text(
            this.suite,
            style: TextStyle(
              fontSize: 28.0,
            ),
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
