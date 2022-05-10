import 'package:flutter/material.dart';

class GroundStackCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 249, 255, 247)
      ..style = PaintingStyle.fill
      ..strokeWidth = 30;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0671875, size.height * 0.1790000);
    path0.quadraticBezierTo(size.width * 0.6053875, size.height * 0.4000000,
        size.width * 1.0312500, size.height * 0.1068750);
    path0.quadraticBezierTo(size.width * 1.0307000, size.height * 0.9151500,
        size.width * 1.0325000, size.height * 0.8625000);
    path0.lineTo(size.width * 0.0656250, size.height * 0.8625000);
    path0.lineTo(size.width * 0.0671875, size.height * 0.1375000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
