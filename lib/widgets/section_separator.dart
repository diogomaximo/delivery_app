import 'package:flutter/material.dart';

class SectionSeparator extends CustomPainter {
  Paint _paint;
  Paint _paintBigger;
  bool isPainterBigger;
  int extraSize = 0;
  int extraLineHeight;
  bool showVerticalLine;

  SectionSeparator(this.extraSize,
      {this.isPainterBigger: false, this.extraLineHeight:0, this.showVerticalLine:false}) {
    _paintBigger = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    _paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-27.5 + (extraSize * -1), 0.0), Offset(27.5 + extraSize, 0.0), _paint);
    if (showVerticalLine){
      canvas.drawLine(Offset(0.0, 0.0), Offset(0.0, -10.0 + extraLineHeight), (isPainterBigger ? _paintBigger : _paint));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}