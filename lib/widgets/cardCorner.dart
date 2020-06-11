import 'package:flutter/material.dart';

class CardCorner extends StatelessWidget {
  const CardCorner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      padding: EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'A',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          Text(
            '\u2660',
            style: TextStyle(
              fontSize: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
