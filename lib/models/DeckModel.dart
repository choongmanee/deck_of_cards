import 'package:deckofcards/models/CardModel.dart';
import 'package:flutter/foundation.dart';

class DeckModel extends ChangeNotifier {
  final Map<String, CardModel> _cards = {};
  final List<String> _stack = [];
  final _discarded = [];
  double _angle = 0.0;
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
  get angle => _angle;

  create() {
    _ranks.forEach((rank, body) {
      _suites.forEach((suit, suitCode) {
        _cards['$rank$suit'] = CardModel(
          id: '$rank$suit',
          rank: rank,
          suitCode: suitCode,
          sides: body.first,
          center: body.last,
          centerGap: ['7', '9'].contains(rank),
        );

        _stack.add('$rank$suit');
      });
    });

    notifyListeners();
  }

  update(CardModel card) {
    _cards[card.id] = card;

    notifyListeners();
  }

  shuffle() {
    _stack.shuffle();
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

  transform(value) {
    _angle = value;

    notifyListeners();
  }
}
