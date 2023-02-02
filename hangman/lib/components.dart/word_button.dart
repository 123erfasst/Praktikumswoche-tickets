import 'package:flutter/material.dart';

import '../utilities/constants.dart';

typedef onPressedFunction = void Function()?;

class WordButton extends StatelessWidget {
  WordButton({required this.buttonTitle, required this.onPress});

  final onPressedFunction onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(4.0),
      color: kWordButtonColor,
      onPressed: onPress,
      child: Text(
        buttonTitle,
        textAlign: TextAlign.center,
        style: kWordButtonTextStyle,
      ),
    );
  }
}
