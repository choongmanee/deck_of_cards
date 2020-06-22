import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardBody extends StatelessWidget {
  final int sides;
  final int center;
  final String suit;
  final bool centerGap;
  final String rank;

  CardBody({
    this.sides,
    this.center,
    this.suit,
    this.centerGap,
    this.rank,
  });

  bool isFaceCard() => (this.sides + this.center) > 10;

  List<Widget> suites(int count, bool centerGap) {
    return List.generate(
      centerGap ? count + 1 : count,
      (int index) {
        Widget suit;
        int half = (count / 2).ceil();

        if (centerGap && index == count) {
          suit = Container();
        } else {
          if (count == 1 || half > index) {
            suit = Text(
              this.suit,
              style: TextStyle(
                  fontSize: 36.0,
                  color: this.suit == '\u2666' || this.suit == '\u2665'
                      ? Colors.red
                      : Colors.black),
            );
          } else {
            suit = RotatedBox(
              quarterTurns: 2,
              child: Text(
                this.suit,
                style: TextStyle(
                    fontSize: 36.0,
                    color: this.suit == '\u2666' || this.suit == '\u2665'
                        ? Colors.red
                        : Colors.black),
              ),
            );
          }
        }

        return suit;
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
                        this.suit,
                        style: TextStyle(
                          fontSize: 36.0,
                          color: this.suit == '\u2666' || this.suit == '\u2665'
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                      Text(
                        this.rank,
                        style: GoogleFonts.robotoSlab(
                          fontSize: 72.0,
                          color: this.suit == '\u2666' || this.suit == '\u2665'
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: this.suit == '\u2666' || this.suit == '\u2665'
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
                          this.suit,
                          style: TextStyle(
                            fontSize: 36.0,
                            color:
                                this.suit == '\u2666' || this.suit == '\u2665'
                                    ? Colors.red
                                    : Colors.black,
                          ),
                        ),
                        Text(
                          this.rank,
                          style: GoogleFonts.robotoSlab(
                            fontSize: 72.0,
                            color:
                                this.suit == '\u2666' || this.suit == '\u2665'
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
                    children: suites(this.sides, false),
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
                    children: suites(this.sides, false),
                  ),
                ),
              ],
            ),
    );
  }
}
