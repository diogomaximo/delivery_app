import 'package:flutter/material.dart';

class BottomButtons extends StatefulWidget {
  @override
  Function changeMode;

  BottomButtons(this.changeMode){

  }
  _BottomButtonsState createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<BottomButtons> {
  String selectedOption = "Map";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            topRight: const Radius.circular(40.0),
          ),
          color: Colors.white),
      child: Padding(padding: EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            IconButton(
              icon: Icon(Icons.format_list_bulleted, color: Color.fromRGBO(111, 42, 244, 1),),
              iconSize: 30,
            ),
            Row(
              children: <Widget>[
                rounderButton("Map"),
                rounderButton("List"),
              ],
            ),
            IconButton(
              icon: Icon(Icons.view_module, color: Color.fromRGBO(111, 42, 244, 1),),
              iconSize: 30,
              color: Colors.purple,
            ),
          ],
        ),),
    );
  }

  Widget rounderButton(String text){
    Color backgroundColor = (text == selectedOption ?   Color.fromRGBO(238, 228, 253, 1): Colors.transparent );
    Color textColor = (text == selectedOption ?   Color.fromRGBO(111, 42, 244, 1): Color.fromRGBO(198, 188, 212, 1) );

    return Container(
      width: 76,
      child: FlatButton(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(60),
            side: BorderSide(color: Colors.white, width: 1)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          setState(() {
            selectedOption = text;
            widget.changeMode(selectedOption);
          });
        },
      ),
    );
  }
}

