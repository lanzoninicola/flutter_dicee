import 'package:flutter/material.dart';
import 'package:dicee/random_number.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollingDices() {
    handleLeftDiceNumber();
    handleRightDiceNumber();
  }

  void handleLeftDiceNumber() {
    setState(() {
      leftDiceNumber = RandomNumber().newNumber();
    });
  }

  void handleRightDiceNumber() {
    setState(() {
      rightDiceNumber = RandomNumber().newNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Dice(
            number: leftDiceNumber,
            rolling: rollingDices,
          ),
          Dice(
              number: rightDiceNumber,
              rolling: rollingDices),
        ],
      ),
    );
  }
}

class Dice extends StatelessWidget {
  final number;
  final rolling;

  Dice({@required this.number, @required this.rolling});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
            onPressed: () {
              rolling();
            },
            child: Image.asset('images/dice$number.png')));
  }
}
