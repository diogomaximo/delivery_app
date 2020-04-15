import 'dart:ffi';

import 'package:flutter/material.dart';

class RounderButton extends StatefulWidget {
  String index;
  String selectedRoute;
  Function onSelectRoute;
  Color borderColor;
  double borderWidth;
  Color textColor;

  RounderButton(this.selectedRoute, this.index, this.onSelectRoute,
      {this.borderColor = Colors.white, this.borderWidth = 1,
        this.textColor = Colors.white,
      } );

  @override
  _RounderButtonState createState() => _RounderButtonState();
}

class _RounderButtonState extends State<RounderButton> {
  @override
  Widget build(BuildContext context) {
     bool isSelected = (widget.index == widget.selectedRoute);
    double width = (widget.index.length == 1 ? 35 : 65);
    Color backgroundColor = (isSelected ? Colors.white : Colors.transparent);
    Color textColor =
    (isSelected ? Color.fromRGBO(111, 42, 244, 1) : widget.textColor);

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      width: width,
      child: FlatButton(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color: widget.borderColor, width: widget.borderWidth)),
        child: Text(
          widget.index,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor),
        ),
        onPressed: () {
          setState(() {
//            widget.selectedRoute = widget.index;
            widget.onSelectRoute();
          });
        },
      ),
    );
  }
}

