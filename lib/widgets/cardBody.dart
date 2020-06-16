import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardBody extends StatelessWidget {
  final int left;
  final int center;
  final int right;
  final String suite;
  final bool centerGap;
  final String rank;

  CardBody({
    this.left,
    this.center,
    this.right,
    this.suite,
    this.centerGap,
    this.rank,
  });

  bool isFaceCard() => (this.left + this.center + this.right) > 10;

  List<Widget> suites(int count, bool centerGap) {
    return List.generate(
      centerGap ? count + 1 : count,
      (int index) {
        Widget suite;
        int half = (count / 2).ceil();

        if (centerGap && index == count) {
          suite = Container();
        } else {
          if (count == 1 || half > index) {
            suite = Text(
              this.suite,
              style: TextStyle(
                  fontSize: 52.0,
                  color: this.suite == '\u2666' || this.suite == '\u2665'
                      ? Colors.red
                      : Colors.black),
            );
          } else {
            suite = RotatedBox(
              quarterTurns: 2,
              child: Text(
                this.suite,
                style: TextStyle(
                    fontSize: 52.0,
                    color: this.suite == '\u2666' || this.suite == '\u2665'
                        ? Colors.red
                        : Colors.black),
              ),
            );
          }
        }

        return suite;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isFaceCard()
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        this.suite,
                        style: TextStyle(
                          fontSize: 48.0,
                          color:
                              this.suite == '\u2666' || this.suite == '\u2665'
                                  ? Colors.red
                                  : Colors.black,
                        ),
                      ),
                      Text(
                        this.rank,
                        style: GoogleFonts.robotoSlab(
                          fontSize: 96.0,
                          color:
                              this.suite == '\u2666' || this.suite == '\u2665'
                                  ? Colors.red
                                  : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: this.suite == '\u2666' || this.suite == '\u2665'
                        ? Colors.red
                        : Colors.black,
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          this.suite,
                          style: TextStyle(
                            fontSize: 48.0,
                            color:
                                this.suite == '\u2666' || this.suite == '\u2665'
                                    ? Colors.red
                                    : Colors.black,
                          ),
                        ),
                        Text(
                          this.rank,
                          style: GoogleFonts.robotoSlab(
                            fontSize: 96.0,
                            color:
                                this.suite == '\u2666' || this.suite == '\u2665'
                                    ? Colors.red
                                    : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: suites(this.left, false),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: suites(this.center, this.centerGap),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: suites(this.right, false),
                  ),
                ),
              ],
            ),
    );
  }
}
