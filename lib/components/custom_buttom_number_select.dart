import 'package:flutter/material.dart';

class CustomButtonNumberSelect extends StatelessWidget {
  const CustomButtonNumberSelect({
    Key? key,
    required this.number,
    this.selected = false,
    required this.onClicked,
  }) : super(key: key);

  final int number;
  final bool selected;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
      child: ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          primary: selected
              ? const Color.fromARGB(255, 61, 219, 143).withOpacity(0.6)
              : Colors.pink,
        ),
        child: Text(
          number.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}





// @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: StatefulBuilder(
//           builder: (context, setState) {
//             return ElevatedButton(
//               onPressed: () {
//                 print(number);
//                 setState(() => _flag = !_flag);
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: _flag
//                     ? Colors.green
//                     : Colors.pink, // This is what you need!
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   number.toString(),
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 28,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ));
//   }



