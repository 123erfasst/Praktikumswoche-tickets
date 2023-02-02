class Game {
  List gameState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  void buttonPressed(int index) {
    print(index);
  }

  void newGame() {
    print("new Game");
  }

  List getState() {
    return gameState;
  }

  int getPlayerOScore() {
    return 0;
  }

  int getPlayerXScore() {
    return 0;
  }

  /// 0 = none; 1 = PlayerO; 2 = PlayerX; 3 = Draw;
  int getWinner() {
    return 0;
  }

  /// 1 = PlayerO; 2 = PlayerX;
  int getCurrentPlayer() {
    return 1;
  }
}