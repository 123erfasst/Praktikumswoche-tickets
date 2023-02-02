import 'dart:math';

import 'package:hangman/utilities/constants.dart';

class Game {
  int wrongies = 0;
  int righties = 0;
  static int wordNumber = 0;
  int i = 0;
  static List<String> worties = [
    "hangman",
    "hallo",
    "partyhuetchen",
    "heizoelrueckstossabdaempfung",
    "boxkampfjuryschuetzlinge",
    "oxydschmelzpunktfarbig",
    "plueschfigurwandobjekt",
    "dorfplatzschießuebung"
  ];

  static String wordi = worties[wordNumber];
  List<String> singul = wordi.split('').toSet().toList();

  void buttonPressed(int index) {
    print(singul);
    print(righties);
    print(singul.length);
    if (wordi.contains(alphabet[index])) {
      righties++;
    } else {
      wrongies++;
    }
  }

  String getNewWord() {
    i++;

    return worties[wordNumber];
  }

  bool isWon() {
    if (singul.length <= righties) {
      nextGame();
      return true;
    } else {
      return false;
    }
  }

  bool isLost() {
    if (wrongies >= 6) {
      nextGame();
      return true;
    } else {
      return false;
    }
  }

  int getWrongGuesses() {
    return wrongies;
  }

  nextGame() {
    print("nextgame");
    wordNumber++;
    wordi = worties[wordNumber];
    singul = wordi.split('').toSet().toList();
    righties = 0;
    wrongies = 0;
  }
}
