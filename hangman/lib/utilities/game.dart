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
    "dorfplatzschiessuebung"
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
    rightGuesses = 0;
    wrongGuesses = 0;
    List<String> nochZuerrateneWoerter = List.from(woerterListe);

    nochZuerrateneWoerter.remove(rateWort);

    rateWort =
        nochZuerrateneWoerter[Random().nextInt(nochZuerrateneWoerter.length)];
    wortOhneDuplikate = rateWort.split('').toSet().toList();

    return rateWort;
  }

  bool isWon() {
    if (wortOhneDuplikate.length <= rightGuesses) {
      return true;
    }
    return false;
  }

  bool isLost() {
    if (wrongGuesses >= 6) {
      return true;
    }
    return false;
  }

  int getWrongGuesses() {
    return wrongGuesses;
  }
}
