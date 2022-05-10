import 'package:flutter/material.dart';
import 'package:navegacao_de_tela/controller/dice_notifier.dart';

class DicePathWidget extends StatefulWidget {
  DicePathWidget({
    Key? key,
    required this.path,
    this.curve = Curves.easeInOut,
    required this.child,
    this.duration = const Duration(seconds: 10),
    required this.dicePath,
    required this.playAgain,
    required this.callbackDicePath,
    required this.callbackPlayAgain,
    required this.diceController,
  }) : super(key: key);

  final Curve2D path;
  final Curve curve;
  final Duration duration;
  final Widget child;
  bool dicePath;
  final Function callbackDicePath;
  bool playAgain;
  final Function callbackPlayAgain;
  final DiceNotifier diceController;

  @override
  State<DicePathWidget> createState() => _DicePathWidgetState();
}

class _DicePathWidgetState extends State<DicePathWidget>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = CurvedAnimation(parent: controller, curve: widget.curve);

    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dicePath == true) {
      controller.forward().whenComplete(() async {
        widget.diceController.showResult.value = true;
        widget.diceController.dicePlayAgain.value = false;

        if (widget.diceController.dicePlayAgain.value == false) {
          await Future.delayed(const Duration(seconds: 6), () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: widget.diceController.win
                      ? const Text('PARABÉNS!!')
                      : const Text('OOHH!! QUE PENA'),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        widget.diceController.showResult.value = false;
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          });

          controller.reset();
          widget.callbackDicePath(false);
        }
      });
    }
    final Offset position =
        widget.path.transform(animation.value) * 2.0 - const Offset(1.0, 1.0);
    return Align(
      alignment: Alignment(position.dx, position.dy),
      child: widget.child,
    );
  }
}
