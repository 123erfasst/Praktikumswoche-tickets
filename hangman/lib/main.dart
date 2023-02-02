import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utilities/constants.dart';
import 'package:hangman/screens/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          tooltipTheme: TooltipThemeData(
            decoration: BoxDecoration(
              color: kTooltipColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
              letterSpacing: 1.0,
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: const Color(0xFF421b9b),
          textTheme:
              Theme.of(context).textTheme.apply(fontFamily: 'PatrickHand'),
        ),
        initialRoute: 'gameScreen',
        routes: {'gameScreen': (context) => GameScreen()});
  }
}
