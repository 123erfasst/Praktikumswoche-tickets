import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../components.dart/word_button.dart';
import '../utilities/constants.dart';
import '../utilities/game.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final game = Game();

  String word = "";
  List<int> guessedLetters = [];

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    word = game.getNewWord().toLowerCase();
    guessedLetters = [];
  }

  String getHiddenWord() {
    return List.generate(word.length, (index) {
      return guessedLetters.map((x) => alphabet[x]).contains(word[index])
          ? word[index].toUpperCase()
          : "_";
    }).join();
  }

  Widget createButton(index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 6.0),
      child: Center(
        child: WordButton(
          buttonTitle: alphabet[index].toUpperCase(),
          onPress:
              !guessedLetters.contains(index) ? () => wordPress(index) : null,
        ),
      ),
    );
  }

  void wordPress(int index) {
    game.buttonPressed(index);
    setState(() {
      guessedLetters.add(index);
      if (game.isWon()) {
        showGameWonAlert();
      } else if (game.isLost()) {
        showGameLostAlert();
      }
    });
  }

  void showAlert(AlertStyle style, AlertType type) {
    Alert(
      context: context,
      style: style,
      type: type,
      title: word.toUpperCase(),
      buttons: [
        DialogButton(
          radius: BorderRadius.circular(10),
          child: const Icon(
            MdiIcons.arrowRightThick,
            size: 30.0,
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
              startNewGame();
            });
          },
          width: 127,
          color: kDialogButtonColor,
          height: 52,
        )
      ],
    ).show();
  }

  void showGameWonAlert() {
    showAlert(kSuccessAlertStyle, AlertType.success);
  }

  void showGameLostAlert() {
    showAlert(kFailedAlertStyle, AlertType.error);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          child: Image.asset(
                            'res/images/${game.getWrongGuesses()}.png',
                            height: 1001,
                            width: 991,
                            gaplessPlayback: true,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 35.0),
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            getHiddenWord(),
                            style: kWordTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 2.0, 8.0, 10.0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                //columnWidths: {1: FlexColumnWidth(10)},
                children: [
                  TableRow(children: [
                    TableCell(
                      child: createButton(0),
                    ),
                    TableCell(
                      child: createButton(1),
                    ),
                    TableCell(
                      child: createButton(2),
                    ),
                    TableCell(
                      child: createButton(3),
                    ),
                    TableCell(
                      child: createButton(4),
                    ),
                    TableCell(
                      child: createButton(5),
                    ),
                    TableCell(
                      child: createButton(6),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: createButton(7),
                    ),
                    TableCell(
                      child: createButton(8),
                    ),
                    TableCell(
                      child: createButton(9),
                    ),
                    TableCell(
                      child: createButton(10),
                    ),
                    TableCell(
                      child: createButton(11),
                    ),
                    TableCell(
                      child: createButton(12),
                    ),
                    TableCell(
                      child: createButton(13),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: createButton(14),
                    ),
                    TableCell(
                      child: createButton(15),
                    ),
                    TableCell(
                      child: createButton(16),
                    ),
                    TableCell(
                      child: createButton(17),
                    ),
                    TableCell(
                      child: createButton(18),
                    ),
                    TableCell(
                      child: createButton(19),
                    ),
                    TableCell(
                      child: createButton(20),
                    ),
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: createButton(21),
                    ),
                    TableCell(
                      child: createButton(22),
                    ),
                    TableCell(
                      child: createButton(23),
                    ),
                    TableCell(
                      child: createButton(24),
                    ),
                    TableCell(
                      child: createButton(25),
                    ),
                    const TableCell(
                      child: Text(''),
                    ),
                    const TableCell(
                      child: Text(''),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
