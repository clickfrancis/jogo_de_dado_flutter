import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:navegacao_de_tela/controller/dice_notifier.dart';

class DiceWidget extends AnimatedWidget {
  const DiceWidget({
    Key? key,
    required AnimationController controller,
    required this.diceController,
  }) : super(
          key: key,
          listenable: controller,
        );

  final DiceNotifier diceController;

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    List<bool> dice = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];

    switch (diceController.diceNumber.value) {
      case 1:
        dice[4] = true;
        break;
      case 2:
        dice[0] = true;
        dice[8] = true;
        break;
      case 3:
        dice[0] = true;
        dice[4] = true;
        dice[8] = true;
        break;
      case 4:
        dice[0] = true;
        dice[2] = true;
        dice[6] = true;
        dice[8] = true;
        break;
      case 5:
        dice[0] = true;
        dice[2] = true;
        dice[4] = true;
        dice[6] = true;
        dice[8] = true;
        break;
      default:
        dice[0] = true;
        dice[1] = true;
        dice[2] = true;
        dice[3] = false;
        dice[4] = false;
        dice[5] = false;
        dice[6] = true;
        dice[7] = true;
        dice[8] = true;
    }

    return Transform.rotate(
        angle: _progress.value * 20 - 0.0 * math.pi,
        child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ValueListenableBuilder<int>(
              valueListenable: diceController.diceNumber,
              builder: ((context, value, child) {
                return GridView.count(
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    padding: const EdgeInsets.all(5),
                    crossAxisCount: 3,
                    children: [
                      diceCircleNumber(dice[0]),
                      diceCircleNumber(dice[1]),
                      diceCircleNumber(dice[2]),
                      diceCircleNumber(dice[3]),
                      diceCircleNumber(dice[4]),
                      diceCircleNumber(dice[5]),
                      diceCircleNumber(dice[6]),
                      diceCircleNumber(dice[7]),
                      diceCircleNumber(dice[8]),
                    ]);
              }),
            )));
  }

  CircleAvatar diceCircleNumber(bool isActive) {
    return isActive
        ? const CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 5,
          )
        : const CircleAvatar(
            backgroundColor: Colors.pink,
            maxRadius: 5,
          );
  }
}
