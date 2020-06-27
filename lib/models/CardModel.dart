class CardModel {
  final int center;
  final bool centerGap;
  final String id;
  final String rank;
  final int sides;
  final String suitCode;
  bool _faceUp = true;

  CardModel({
    this.center,
    this.centerGap,
    this.id,
    this.rank,
    this.sides,
    this.suitCode,
  });

  get faceUp => _faceUp;

  void flip() {
    _faceUp = !_faceUp;
  }
}
