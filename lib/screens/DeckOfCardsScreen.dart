import 'package:deckofcards/models/CardModel.dart';
import 'package:deckofcards/models/DeckModel.dart';
import 'package:deckofcards/widgets/cardFlipper.dart';
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
              if (deck.stack.length > 0)
                FlatButton.icon(
                  onPressed: () => deck.shuffle(),
                  icon: Icon(Icons.shuffle),
                  label: Text('shuffle'),
                ),
              Center(
                child: deck.stack.length > 0
                    ? Wrap(
                        children: [
                          ...deck.stack.map((cardID) {
                            CardModel card = deck.cards[cardID];

                            return ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 280.0,
                                maxWidth: 200.0,
                              ),
                              child: CardFlipper(
                                card,
                              ),
                            );
                          }).toList(),
                        ],
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
