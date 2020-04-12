import 'package:flutter/material.dart';

class SectionSeparator extends CustomPainter {
  Paint _paint;

  SectionSeparator() {
    _paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-210.0, 0.0), Offset(210.0, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}