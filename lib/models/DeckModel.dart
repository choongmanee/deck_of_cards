import 'package:deckofcards/models/CardModel.dart';
import 'package:flutter/foundation.dart';

class DeckModel extends ChangeNotifier {
  final Map<String, CardModel> _cards = {};
  final List<String> _stack = [];
  final List<CardModel> _cardStack = [];
  final _discarded = [];
  final Map<String, List<int>> _ranks = {
    'A': [0, 1],
    '2': [0, 2],
    '3': [0, 3],
    '4': [2, 0],
    '5': [2, 1],
    '6': [3, 0],
    '7': [3, 1],
    '8': [3, 2],
    '9': [4, 1],
    '10': [4, 2],
    'J': [5, 6],
    'Q': [5, 7],
    'K': [5, 8],
  };

  final Map<String, String> _suites = {
    's': '\u2660',
    'c': '\u2663',
    'd': '\u2666',
    'h': '\u2665',
  };

  get cards => _cards;
  get stack => _stack;
  get cardStack => _cardStack;

  create() {
    _ranks.forEach((rank, body) {
      _suites.forEach((suit, suitCode) {
        CardModel card = CardModel(
          id: '$rank$suit',
          rank: rank,
          suitCode: suitCode,
          sides: body.first,
          center: body.last,
          centerGap: ['7', '9'].contains(rank),
        );

        _cards['$rank$suit'] = card;
        _stack.add('$rank$suit');
        _cardStack.add(card);
      });
    });

    notifyListeners();
  }

  update(CardModel newCard) {
    final int index =
        _cardStack.indexWhere((element) => element.id == newCard.id);
    _cardStack[index] = newCard;

    notifyListeners();
  }

  shuffle() {
    _cardStack.shuffle();

    notifyListeners();
  }

  draw() {
    if (_stack.length > 0) {
      var removed = _stack.removeAt(0);
      _discarded.add(removed);
    }

    notifyListeners();
  }

  undo() {
    if (_discarded.length > 0) {
      var removed = _discarded.removeAt(0);
      _stack.insert(0, removed);
    }
    notifyListeners();
  }
}
