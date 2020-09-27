import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Dicee',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  int getRandomInt() {
    return Random().nextInt(6) + 1;
  }

  reassignDiceNumbers() {
    setState(() {
      leftDiceNumber = getRandomInt();
      rightDiceNumber = getRandomInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                // FlatButton adds by default 16.0 px of horizontal padding.
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 0.0,
                ),
                child: FlatButton(
                  child: Image.asset('images/d$leftDiceNumber.png'),
                  onPressed: () => reassignDiceNumbers(),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 0.0,
                ),
                child: FlatButton(
                  child: Image.asset('images/d$rightDiceNumber.png'),
                  onPressed: () => reassignDiceNumbers(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
