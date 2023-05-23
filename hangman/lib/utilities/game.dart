import 'dart:math';

import 'package:hangman/utilities/constants.dart';

class Game {
  void buttonPressed(int index) {
    print(alphabet[index]);
  }

  String getNewWord() {
    return "Hangman";
  }

  bool isWon() {
    return false;
  }

  bool isLost() {
    return false;
  }

  int getWrongGuesses() {
    return 0;
  }
}
