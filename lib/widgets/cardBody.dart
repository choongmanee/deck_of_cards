import 'dart:core';

import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  final int left;
  final int center;
  final int right;
  final String suite;

  CardBody({this.left, this.center, this.right, this.suite});

  List<Widget> suites(int count) {
    return List.generate(
      count,
      (int index) {
        Widget suite;
        int half = (count / 2).ceil();

        if (count == 1) {
          suite = Text(
            this.suite,
            style: TextStyle(
              fontSize: 52.0,
            ),
          );
        } else if (half > index) {
          suite = Text(
            this.suite,
            style: TextStyle(
              fontSize: 52.0,
            ),
          );
        } else {
          suite = RotatedBox(
            quarterTurns: 2,
            child: Text(
              this.suite,
              style: TextStyle(
                fontSize: 52.0,
              ),
            ),
          );
        }

        return suite;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: suites(this.left),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: suites(this.center),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: suites(this.right),
            ),
          ),
        ],
      ),
    );
  }
}
