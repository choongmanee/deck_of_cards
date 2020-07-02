import 'dart:math';

import 'package:deckofcards/models/CardModel.dart';
import 'package:deckofcards/widgets/PlayingCard.dart';
import 'package:flutter/material.dart';

class CardFlipper extends StatefulWidget {
  final CardModel card;

  CardFlipper(this.card);

  @override
  _CardFlipperState createState() => _CardFlipperState();
}

class _CardFlipperState extends State<CardFlipper>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  _CardFlipperState();

  @override
  void initState() {
    _controller = AnimationController(
      value: widget.card.faceUp ? 0.0 : 1.0,
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
    if (widget.card.faceUp) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    //TODO: fix animation and refactor into playingCard
    if (widget.card.faceUp) {
      _controller.value = 0.0;
    } else {
      _controller.value = 1.0;
    }

    return PlayingCard(
      card: widget.card,
      radians: _controller.value * pi,
      flip: flip,
    );
  }
}
