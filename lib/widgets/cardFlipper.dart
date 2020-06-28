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
      value: this.card.faceUp ? 1.0 : 0.0,
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 250),
    );
    super.initState();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void flip() {
    if (this.card.faceUp) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlayingCard(
      card: this.card,
      radians: _controller.value * pi,
      flip: flip,
    );
  }
}
