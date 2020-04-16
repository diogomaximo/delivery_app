import 'package:delivery_app/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RouteDetails extends StatefulWidget {
  @override
  _RouteDetailsState createState() => _RouteDetailsState();
}

class _RouteDetailsState extends State<RouteDetails> {
  Color buttonColor = Color.fromRGBO(97, 97, 97, 1);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: mainContainerDecoration(),
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RounderButton(
                "1",
                "2",
                    () {},
                borderColor: buttonColor,
                borderWidth: 2,
                textColor: buttonColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "ABR54",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Time range",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "9:00 - 12:00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Delivery Time",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "16:47",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  rounderButton("Accepted \n time"),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 14),
                child: Divider(),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Alex",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "31321321312312",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  callButtom(),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 14),
                child: Divider(),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "2149 W Polk St",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Chicago IL 60612",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  routeButom(),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 24),
              ),
              Center(
                child: markAsDone(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget rounderButton(String text) {
    Color backgroundColor = Color.fromRGBO(220, 241, 251, 0.7);
    Color textColor = Color.fromRGBO(125, 202, 237, 1);

    return Container(
        width: 154,
        height: 80,
        child: FlatButton(
          onPressed: () {},
          color: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20),
              side: BorderSide(color: Colors.white, width: 1)),
          child: Row(
            children: <Widget>[
              Icon(Icons.check, color: textColor),
              SizedBox(width: 6),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              )
            ],
          ),
        ));
  }

  Widget callButtom() {
    Color backgroundColor = Color.fromRGBO(88, 32, 190, 1);
    Color phoneColor = Color.fromRGBO(125, 202, 237, 1);

    return Container(
        width: 54,
        height: 54,
        child: FlatButton(
          onPressed: () {},
          color: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20),
              side: BorderSide(color: Colors.white, width: 1)),
          child: Icon(Icons.phone, color: phoneColor),

        ));
  }


  Widget markAsDone() {
    Color backgroundColor = Colors.white;
    Color phoneColor =  Color.fromRGBO(88, 32, 190, 1);

    return Container(
        width: 170,
        height: 50,
        child: FlatButton(
          onPressed: () {},
          color: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20),
              side: BorderSide(color: Colors.black26, width: 1)),
          child: Row(
            children: <Widget>[
              Icon(Icons.check, color: phoneColor),
              SizedBox(width: 6),
              Text(
                "FINISH ROUTE",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: phoneColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              )
            ],
          ),

        ));
  }

  Widget routeButom() {
    Color backgroundColor = Colors.white;
    Color phoneColor =  Color.fromRGBO(88, 32, 190, 1);

    return Container(
        width: 54,
        height: 54,
        child: FlatButton(
          onPressed: () {},
          color: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20),
              side: BorderSide(color: Colors.black26, width: 1)),
          child: Icon(Icons.gps_fixed, color: phoneColor),

        ));
  }

  BoxDecoration mainContainerDecoration() {
    return BoxDecoration(
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(40.0),
          topRight: const Radius.circular(40.0),
        ),
        color: Colors.white);
  }
}
