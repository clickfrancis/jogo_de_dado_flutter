import 'dart:math';

import 'package:flutter/material.dart';

class DiceNotifier extends ChangeNotifier {
  ValueNotifier<int> diceNumber = ValueNotifier<int>(1);

  ValueNotifier<int> diceSelectedNumber = ValueNotifier<int>(0);

  ValueNotifier<bool> dicePlayAgain = ValueNotifier<bool>(false);

  ValueNotifier<bool> showResult = ValueNotifier<bool>(false);

  int random = 1;
  bool playAgain = false;
  int result = 0;
  bool win = false;

  Future<int> sortDice() async {
    dicePlayAgain.value = true;
    while (dicePlayAgain.value) {
      await Future.delayed(const Duration(milliseconds: 600), () {
        random = Random().nextInt(6) + 1;
        diceNumber.value = random;
      });
    }
    result = diceNumber.value;

    if (result == diceSelectedNumber.value) {
      win = true;
      showResult.value = true;
    } else {
      win = false;
      showResult.value = true;
    }
    diceSelectedNumber.value = 0;
    return result;
  }
}
