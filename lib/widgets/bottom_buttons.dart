import 'package:flutter/material.dart';

class BottomButtons extends StatefulWidget {
  @override
  Function changeMode;
  String viewType = "Map";
  String viewMode2 = "Map";



  BottomButtons(this.viewType, this.changeMode);
  _BottomButtonsState createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: (widget.viewType == "Map" ? Colors.transparent : Colors.white ) ,
      height: 120,
      child: Container(
        decoration: new BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20.0,
                spreadRadius: 5.0,
                offset: Offset(
                  4.0, // horizontal, move right 10
                  4.0, // vertical, move down 10
                ),
              )
            ],
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            ),
            color: Colors.white),
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.format_list_bulleted,
                  color: Color.fromRGBO(111, 42, 244, 1),
                ),
                iconSize: 30,
              ),
              Row(
                children: <Widget>[
                  rounderButton("Map"),
                  rounderButton("List"),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.view_module,
                  color: Color.fromRGBO(111, 42, 244, 1),
                ),
                iconSize: 30,
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rounderButton(String text) {
    Color backgroundColor = (text == widget.viewType
        ? Color.fromRGBO(238, 228, 253, 1)
        : Colors.transparent);
    Color textColor = (text == widget.viewType
        ? Color.fromRGBO(111, 42, 244, 1)
        : Color.fromRGBO(198, 188, 212, 1));

    return Container(
      width: 76,
      child: FlatButton(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(60),
            side: BorderSide(color: Colors.white, width: 1)),
        child: Text(
          text , //text,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          setState(() {
            widget.viewType = text;
           widget.changeMode(text);
          });
        },
      ),
    );
  }
}
