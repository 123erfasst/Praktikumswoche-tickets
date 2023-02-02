import 'package:flutter/material.dart';

import 'components/my_button.dart';
import 'utilities/calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Calculator calculator = Calculator();

  // Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  Color? getButtonColor(index) {
    if (isOperatorButton(buttons[index])) {
      return Colors.blueAccent;
    } else if (isTopRowButton(buttons[index])) {
      return Colors.blue[50];
    } else if (isEqualButton(buttons[index])) {
      return Colors.orange[700];
    }
    return Colors.white;
  }

  Color? getButtonTextColor(index) {
    if (isOperatorButton(buttons[index]) || isEqualButton(buttons[index])) {
      return Colors.white;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ), //AppBar
      backgroundColor: Colors.white38,
      body: Column(
        children: <Widget>[
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    calculator.getTopText(),
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    calculator.getBottomText(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ])),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return MyButton(
                    buttontapped: () {
                      setState(() {
                        calculator.buttonPressed(buttons[index]);
                      });
                    },
                    buttonText: buttons[index],
                    color: getButtonColor(index),
                    textColor: getButtonTextColor(index),
                  );
                }),
          ),
        ],
      ),
    );
  }

  bool isTopRowButton(String x) {
    return (x == 'C' || x == '+/-' || x == '%' || x == 'DEL');
  }

  bool isOperatorButton(String x) {
    return (x == '/' || x == 'x' || x == '-' || x == '+');
  }

  bool isEqualButton(String x) {
    return x == '=';
  }
}
