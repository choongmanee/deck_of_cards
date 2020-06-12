import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  final int left;
  final int center;
  final int right;
  CardBody({this.left, this.center, this.right});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0, bottom: 48.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.filled(
                  this.left,
                  Text(
                    '\u2660',
                    style: TextStyle(
                      fontSize: 52.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.filled(
                  this.center,
                  Text(
                    '\u2660',
                    style: TextStyle(
                      fontSize: 52.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.filled(
                  this.right,
                  Text(
                    '\u2660',
                    style: TextStyle(
                      fontSize: 52.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
