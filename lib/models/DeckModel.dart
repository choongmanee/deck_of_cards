import 'package:flutter/foundation.dart';

class DeckModel extends ChangeNotifier {
  final _cards = [];
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

  final List<String> _suites = ['\u2660', '\u2663', '\u2666', '\u2665'];

  get cards => _cards;

  create() {
    _ranks.forEach((rank, body) {
      _suites.forEach((suit) {
        _cards.add({
          'rank': rank,
          'suit': suit,
          'body': body,
        });
      });
    });

    notifyListeners();
  }

  shuffle() {
    _cards.shuffle();
    notifyListeners();
  }

  draw() {
    if (_cards.length > 0) {
      var removed = _cards.removeAt(0); // TODO: make a class for a card
      _discarded.add(removed);
    }

    notifyListeners();
  }

  reset() {
    notifyListeners();
  }
}
