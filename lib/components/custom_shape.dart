import 'package:flutter/material.dart';

class CustomShapeClass extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height / 4.25);
    var firstControlPoint = Offset(size.width / 4 - 10, size.height / 3);
    var firstEndPoint = Offset(size.width / 2, size.height / 3 - 60);
    var secondControlPoint =
        Offset(size.width - (size.width / 5), size.height / 4 - 80);
    var secondEndPoint = Offset(size.width, size.height / 3 - 40);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
