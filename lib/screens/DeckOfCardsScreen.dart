import 'dart:math';

import 'package:deckofcards/models/DeckModel.dart';
import 'package:deckofcards/widgets/PlayingCard.dart';
import 'package:deckofcards/widgets/cardBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeckOfCardsScreen extends StatelessWidget {
  final ranks = {
    'A': [0, 1, 0],
    '2': [0, 2, 0],
    '3': [0, 3, 0],
    '4': [2, 0, 2],
    '5': [2, 1, 2],
    '6': [3, 0, 3],
    '7': [3, 1, 3],
    '8': [3, 2, 3],
    '9': [4, 1, 4],
    '10': [4, 2, 4],
    'J': [5, 5, 5],
    'Q': [6, 6, 6],
    'K': [7, 7, 7],
  };

  final suites = ['\u2660', '\u2663', '\u2666', '\u2665'];

  @override
  Widget build(BuildContext context) {
    var deck = Provider.of<DeckModel>(context);

    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Slider(
                value: deck.angle,
                onChanged: (v) {
                  deck.transform(v);
                },
                min: 0.0,
                max: pi,
              ),
              if (deck.cards.length > 0)
                FlatButton.icon(
                  onPressed: () => deck.shuffle(),
                  icon: Icon(Icons.shuffle),
                  label: Text('shuffle'),
                ),
              Center(
                child: deck.cards.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: deck.cards.length,
                        itemBuilder: (context, index) {
                          String suit = deck.cards[index]['suit'];
                          String rank = deck.cards[index]['rank'];
                          int sides = deck.cards[index]['body'].first;
                          int center = deck.cards[index]['body'].last;

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LimitedBox(
                                maxHeight: 280.0,
                                maxWidth: 200.0,
                                child: PlayingCard(
                                  suit: deck.cards[index]['suit'],
                                  rank: deck.cards[index]['rank'],
                                  body: CardBody(
                                    center: center,
                                    centerGap: ['7', '9'].contains(rank),
                                    rank: rank,
                                    suit: suit,
                                    sides: sides,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      )
                    : FlatButton(
                        onPressed: () => deck.create(),
                        child: Text('create'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
