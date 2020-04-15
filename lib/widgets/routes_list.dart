import 'package:delivery_app/widgets/rounded_button.dart';
import 'package:delivery_app/widgets/section_separator.dart';
import 'package:flutter/material.dart';

class RoutesList extends StatefulWidget {
  int index;
  String selectedRoute;
  Function onSelectRoute;

  RoutesList(this.onSelectRoute, this.selectedRoute);

  @override
  _RoutesListState createState() => _RoutesListState();
}

class _RoutesListState extends State<RoutesList> {
  var hours = {"1": "11:00", "4": "12:00", "6": "13:00", "8": "14:00"};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 190.0,
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 0, right: 0, bottom: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 20,
                    );
                  },
                  padding: EdgeInsets.only(top: 12, bottom: 0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext ctxt, int index) {
                    if (index == 0) {
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Route",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 960),
                            padding: EdgeInsets.only(top: 25),
                            child: CustomPaint(painter: SectionSeparator(10)),
                          )
                        ],
                      );
                    }

                    if (index == 1) {
                      return SizedBox(
                        width: 20,
                        child: Container(
                          padding: EdgeInsets.only(top: 58),
//                                      color: Colors.red,
                          child: CustomPaint(painter: SectionSeparator(2)),
                        ),
                      );
                    }

                    if (index == 3) {
                      return Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 58),
                          ),
                          Container(
                            child: CustomPaint(
                                painter: SectionSeparator(-19,
                                    isPainterBigger: true,
                                    extraLineHeight: -44,
                                    showVerticalLine: true)),
                          ),
                        ],
                      );
                    }

                    String indexString =
                        (index < 2 ? "${index}" : "${index - 1}");
                    if (index == 4) {
                      indexString = "${index - 2} - ${index - 1}";
                    }

                    return Column(
                      children: <Widget>[
                        RounderButton(widget.selectedRoute, indexString, (){
                          setState(() {
                            widget.selectedRoute = indexString;
                            widget.onSelectRoute(indexString);
                          });
                        }),
//                        rounderButton(indexString),
                        Container(
                          child: CustomPaint(
                              painter: SectionSeparator(index == 4 ? 15 : 0,
                                  extraLineHeight:
                                      (hours.containsKey(indexString) ? 0 : 3),
                                  showVerticalLine: true)),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        hourText(indexString),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }

  Widget hourText(String indexString) {
    if (!hours.containsKey(indexString)) {
      return SizedBox();
    }

    return Text(
      hours[indexString],
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
