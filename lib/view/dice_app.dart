import 'package:flutter/material.dart';
import 'package:navegacao_de_tela/view/play_dice_view.dart';

class DiceApp extends StatelessWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
      ),
      home: const PlayDiceView(),
    );
  }
}
