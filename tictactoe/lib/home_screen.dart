import 'package:flutter/material.dart';

import 'alert_dialog.dart';
import 'constants.dart';
import 'game.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                game.newGame();
              });
            },
          )
        ],
        title: Text(
          'Tic Tac Toe',
          style: kCustomText(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          _buildPointsTable(),
          _buildGrid(),
          _buildTurn(),
        ],
      ),
    );
  }

  Widget _buildPointsTable() {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Player O',
                    style: kCustomText(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    game.getPlayerOScore().toString(),
                    style: kCustomText(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Column(
                children: [
                  Text(
                    'Player X',
                    style: kCustomText(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    game.getPlayerXScore().toString(),
                    style: kCustomText(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  game.buttonPressed(index);
                });
                game.buttonPressed(index);
                var winner = game.getWinner();
                if (winner == 1) {
                  _showAlertDialog('Winner', 'O');
                } else if (winner == 2) {
                  _showAlertDialog('Winner', 'X');
                } else if (winner == 3) {
                  _showAlertDialog('Draw', '');
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[700] ?? Colors.grey)),
                child: Center(
                  child: Text(
                    game.getState()[index],
                    style: TextStyle(
                      color: game.getState()[index] == 'x' ||
                              game.getState()[index] == 'X'
                          ? Colors.white
                          : Colors.red,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildTurn() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          game.getCurrentPlayer() == 1 ? 'Turn of O' : 'Turn of X',
          style: kCustomText(color: Colors.white),
        ),
      ),
    );
  }

  void _showAlertDialog(String title, String winner) {
    showAlertDialog(
        context: context,
        title: title,
        content: winner == ''
            ? 'The match ended in a draw'
            : 'The winner is ${winner.toUpperCase()}',
        defaultActionText: 'OK',
        onOkPressed: () {
          Navigator.of(context).pop();
          setState(() {
            game.newGame();
          });
        });
  }
}
