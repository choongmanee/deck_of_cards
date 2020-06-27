import 'package:deckofcards/models/DeckModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/DeckOfCardsScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DeckModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeckOfCardsScreen(),
    );
  }
}
