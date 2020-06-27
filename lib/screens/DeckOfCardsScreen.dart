import 'dart:math';

import 'package:deckofcards/models/CardModel.dart';
import 'package:deckofcards/models/DeckModel.dart';
import 'package:deckofcards/widgets/PlayingCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeckOfCardsScreen extends StatelessWidget {
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
              if (deck.stack.length > 0)
                FlatButton.icon(
                  onPressed: () => deck.shuffle(),
                  icon: Icon(Icons.shuffle),
                  label: Text('shuffle'),
                ),
              Center(
                child: deck.stack.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: deck.stack.length,
                        itemBuilder: (context, index) {
                          CardModel card = deck.cards[deck.stack[index]];

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LimitedBox(
                                maxHeight: 280.0,
                                maxWidth: 200.0,
                                child: PlayingCard(
                                  card,
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
