import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'cardBody.dart';
import 'cardCorner.dart';

class CardTemplate extends StatelessWidget {
  const CardTemplate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CardCorner(),
          CardBody(
            left: 0,
            center: 1,
            right: 0,
          ),
          Transform.rotate(
            angle: math.pi / 1.0,
            child: CardCorner(),
          ),
        ],
      ),
      width: 250.0,
      height: 350.0,
    );
  }
}
