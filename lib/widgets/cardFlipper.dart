import 'dart:math';

import 'package:deckofcards/models/CardModel.dart';
import 'package:deckofcards/widgets/PlayingCard.dart';
import 'package:flutter/material.dart';

class CardFlipper extends StatefulWidget {
  final CardModel card;

  CardFlipper(this.card);

  @override
  _CardFlipperState createState() => _CardFlipperState(this.card);
}

class _CardFlipperState extends State<CardFlipper>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final CardModel card;

  _CardFlipperState(this.card);

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        upperBound: pi,
        lowerBound: 0.0);
    super.initState();

    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_controller.value);

    return PlayingCard(
      this.card,
      pi,
    );
  }
}
