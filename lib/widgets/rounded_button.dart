import 'package:flutter/material.dart';

class RounderButton extends StatefulWidget {
  String index;
  String selectedRoute;
  Function onSelectRoute;
  RounderButton(this.selectedRoute, this.index, this.onSelectRoute );

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
    (isSelected ? Color.fromRGBO(111, 42, 244, 1) : Colors.white);

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      width: width,
      child: FlatButton(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.white, width: 1)),
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

