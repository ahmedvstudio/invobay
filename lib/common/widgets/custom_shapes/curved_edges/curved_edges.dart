import 'package:flutter/material.dart';

class VCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    // First Curve
    final firstCurveStart = Offset(0, size.height - 20);
    final firstCurveEnd = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstCurveStart.dx, firstCurveStart.dy,
        firstCurveEnd.dx, firstCurveEnd.dy);

    // Second Curve
    final secondCurveStart = Offset(0, size.height - 20);
    final secondCurveEnd = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondCurveStart.dx, secondCurveStart.dy,
        secondCurveEnd.dx, secondCurveEnd.dy);

    // Third Curve
    final thirdCurveStart = Offset(size.width, size.height - 20);
    final thirdCurveEnd = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdCurveStart.dx, thirdCurveStart.dy,
        thirdCurveEnd.dx, thirdCurveEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  // Advanced
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
