import 'package:flutter/material.dart';
import 'package:navegacao_de_tela/components/custom_buttom_number_select.dart';

import '../controller/dice_notifier.dart';

class DiceSelect extends StatefulWidget {
  const DiceSelect({Key? key, required this.diceController}) : super(key: key);
  final DiceNotifier diceController;

  @override
  State<DiceSelect> createState() => _DiceSelectState();
}

class _DiceSelectState extends State<DiceSelect> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: widget.diceController.diceSelectedNumber,
      builder: ((context, value, child) {
        return GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.6,
            crossAxisSpacing: 5,
            mainAxisSpacing: 3,
          ),
          itemBuilder: (context, index) {
            return CustomButtonNumberSelect(
                number: index + 1,
                selected: value == index + 1,
                onClicked: () {
                  widget.diceController.diceSelectedNumber.value = index + 1;
                });
          },
        );
      }),
    );
  }
}
