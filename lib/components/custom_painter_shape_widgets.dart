import 'package:flutter/material.dart';
import 'package:navegacao_de_tela/components/custom_shape.dart';

class CustomPainterShapeWidgets {
  static Widget buildShape() {
    return ClipPath(
      clipper: CustomShapeClass(),
      child: Container(
        color: const Color.fromARGB(255, 61, 219, 143).withOpacity(0.6),
      ),
    );
  }
}
