import 'package:flutter/material.dart';
import 'package:navegacao_de_tela/components/custom_painter_shape_widgets.dart';
import 'package:navegacao_de_tela/components/dice_path_widget.dart';
import 'package:navegacao_de_tela/components/dice_select.dart';
import 'package:navegacao_de_tela/components/dice_widget.dart';
import 'package:navegacao_de_tela/components/ground_hole_widget.dart';

import 'package:navegacao_de_tela/components/ground_stack_widget.dart';
import 'package:navegacao_de_tela/controller/dice_notifier.dart';

final CatmullRomSpline path = CatmullRomSpline(
  const <Offset>[
    Offset(0.50, 0.95),
    Offset(0.30, 0.38),
    Offset(0.47, 0.30),
    Offset(0.63, 0.37),
    Offset(0.73, 0.60),
    Offset(0.63, 0.40),
    Offset(0.47, 0.38),
    Offset(0.39, 0.60),
    Offset(0.48, 0.50),
    Offset(0.49, 0.55),
    Offset(0.50, 0.60),
  ],
  startHandle: const Offset(0.03, 0.04),
  endHandle: const Offset(0.04, 0.03),
);

class PlayDiceView extends StatefulWidget {
  const PlayDiceView({Key? key}) : super(key: key);

  @override
  State<PlayDiceView> createState() => _PlayDiceViewState();
}

class _PlayDiceViewState extends State<PlayDiceView>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  late final AnimationController _controllerT = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controllerT,
    curve: Curves.fastOutSlowIn,
  );

  DiceNotifier diceController = DiceNotifier();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  bool hole = false;
  bool dicePath = false;
  bool playAgain = false;
  int number = 2;

  callbackHole(value) => setState((() => hole = value));
  callbackDicePath(value) => setState((() => dicePath = value));
  callbackPlayAgain(value) => setState((() => playAgain = value));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 255, 247),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                CustomPainterShapeWidgets.buildShape(),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 190.0, left: 78),
                    child: GroundHoleWidget(
                      hole: hole,
                      callbackFuction: callbackHole,
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: diceController.showResult,
                  builder: ((context, value, child) {
                    return Positioned(
                      child: diceController.showResult.value
                          ? Center(
                              child: ScaleTransition(
                              scale: _animation,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: diceController.win == true
                                    ? Text('WIN',
                                        style: TextStyle(
                                          fontSize: 50.0,
                                          color: const Color.fromARGB(
                                                  255, 61, 219, 143)
                                              .withOpacity(0.8),
                                        ))
                                    : Text('LOSS',
                                        style: TextStyle(
                                          fontSize: 50.0,
                                          color: const Color.fromARGB(
                                                  255, 61, 219, 143)
                                              .withOpacity(0.8),
                                        )),
                              ),
                            ))
                          : const Text(''),
                    );
                  }),
                ),
                Positioned(
                  bottom: 80,
                  left: 60,
                  child: SizedBox(
                    height: 500,
                    width: 300,
                    child: DicePathWidget(
                      dicePath: dicePath,
                      diceController: diceController,
                      path: path,
                      playAgain: playAgain,
                      callbackDicePath: callbackDicePath,
                      callbackPlayAgain: callbackPlayAgain,
                      child: DiceWidget(
                        controller: _controller,
                        diceController: diceController,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 60,
                  child: CustomPaint(
                    size: Size(
                        300,
                        (190 * 1.0)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: GroundStackCustomPainter(),
                  ),
                ),
                Positioned(
                  right: 15,
                  bottom: 10,
                  child: SizedBox(
                    height: 112,
                    width: 80,
                    child: ElevatedButton(
                      onPressed: dicePath == true
                          ? null
                          : () {
                              diceController.sortDice();
                              setState(() {
                                dicePath = true;
                                hole = true;
                              });
                            },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.casino_outlined, size: 50),
                          Text(
                            'PLAY',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: DiceSelect(diceController: diceController)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
