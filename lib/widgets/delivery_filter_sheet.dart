import 'package:delivery_app/widgets/bottom_buttons.dart';
import 'package:delivery_app/widgets/line_path.dart';
import 'package:delivery_app/widgets/section_separator.dart';
import 'package:flutter/material.dart';

class DeliveryFilterSheet extends StatefulWidget {
  @override
  _DeliveryFilterSheetState createState() => _DeliveryFilterSheetState();
}

class _DeliveryFilterSheetState extends State<DeliveryFilterSheet> {
  String selectedRoute = "1";
  var hours = { "1": "11:00", "4": "12:00", "6": "13:00", "8": "14:00" };

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        minChildSize: 0,
        expand: true,
        initialChildSize: 0.34,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            child: Column(
              children: <Widget>[

                SizedBox(
                    height: 150.0,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 40, left: 0, right: 0, bottom: 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 20,
                                );
                              },
                              padding: EdgeInsets.only(top: 12, bottom: 0),
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext ctxt, int index) {
                                if (index == 0){
                                  return Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Route",
                                          style: TextStyle(color: Colors.white, fontSize: 28),
                                        ),
                                      ),
                                      Container(
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
                                        child: CustomPaint(painter: SectionSeparator(-19, isPainterBigger: true, extraLineHeight: -44, showVerticalLine: true)),
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
                                  rounderButton(indexString),
                                    Container(
                                      child: CustomPaint(painter: SectionSeparator(index == 4 ? 15 : 0,  extraLineHeight: (hours.containsKey(indexString)? 0 : 3), showVerticalLine: true )),
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
                    )),
                Spacer(),
                BottomButtons(),

//                Container(
//                  child: CustomPaint(painter: SectionSeparator()),
//                ),
//                Text("OUTRA SECAO")
              ],
            ),
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(111, 42, 244, 1),
                      Color.fromRGBO(67, 25, 144, 1)
                    ])),
          );
        });
  }

  Widget hourText(String indexString){
    if (!hours.containsKey(indexString)){
      return SizedBox();
    }

    return Text(hours[indexString], style: TextStyle(
      color: Colors.white,
    ),);
  }

  Widget rounderButton(String index) {
    bool isSelected = (index == selectedRoute);
    double width = (index.length == 1 ? 35 : 65);
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
          index,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor),
        ),
        onPressed: () {
          setState(() {
            this.selectedRoute = index;
          });
        },
      ),
    );
  }
}
