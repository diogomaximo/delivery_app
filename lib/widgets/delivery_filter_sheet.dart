import 'package:flutter/material.dart';

class DeliveryFilterSheet extends StatefulWidget {
  @override
  _DeliveryFilterSheetState createState() => _DeliveryFilterSheetState();
}

class _DeliveryFilterSheetState extends State<DeliveryFilterSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.30,
        maxChildSize: 0.5,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                    height: 100.0,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 40, left: 30, right: 30, bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Route",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return new Text(
                                  "Route",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                Text("OUTRA SECAO")
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
}
