import 'dart:math';

import 'package:hangman/utilities/constants.dart';

class Game {
  int wrongGuesses = 0;
  int rightGuesses = 0;
  static int wordNumber = 0;
  static List<String> woerterListe = [
    "hangman",
    "hallo",
    "partyhuetchen",
    "heizoelrueckstossabdaempfung",
    "boxkampfjuryschuetzlinge",
    "oxydschmelzpunktfarbig",
    "plueschfigurwandobjekt",
    "dorfplatzschießuebung"
  ];

  static String rateWort = woerterListe[wordNumber];
  List<String> wortOhneDuplikate = rateWort.split('').toSet().toList();

  void buttonPressed(int index) {
    if (rateWort.contains(alphabet[index])) {
      rightGuesses++;
    } else {
      wrongGuesses++;
    }
  }

  String getNewWord() {
    return woerterListe[wordNumber];
  }

  bool isWon() {
    if (wortOhneDuplikate.length <= rightGuesses) {
      nextGame();
      return true;
    }
    return false;
  }

  bool isLost() {
    if (wrongGuesses >= 6) {
      nextGame();
      return true;
    }
    return false;
  }

  int getWrongGuesses() {
    return wrongGuesses;
  }

  nextGame() {
    wordNumber++;
    rateWort = woerterListe[wordNumber];
    wortOhneDuplikate = rateWort.split('').toSet().toList();
    rightGuesses = 0;
    wrongGuesses = 0;
  }
}
