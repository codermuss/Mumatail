import 'package:flutter/material.dart';

class NavbarCustomClip extends CustomClipper<Path> {
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    var width = size.width;
    var height = size.height;

    path.cubicTo(width / 12, 0, width / 12, 2 * height / 5, 2 * width / 12,
        2 * height / 5);
    path.cubicTo(
        3 * width / 12, 2 * height / 5, 3 * width / 12, 0, 4 * width / 12, 0);
    path.cubicTo(5 * width / 12, 0, 5 * width / 12, 2 * height / 5,
        6 * width / 12, 2 * height / 5);
    path.cubicTo(
        7 * width / 12, 2 * height / 5, 7 * width / 12, 0, 8 * width / 12, 0);
    path.cubicTo(9 * width / 12, 0, 9 * width / 12, 2 * height / 5,
        10 * width / 12, 2 * height / 5);
    path.cubicTo(11 * width / 12, 2 * height / 5, 11 * width / 12, 0,
        12 * width / 12, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
