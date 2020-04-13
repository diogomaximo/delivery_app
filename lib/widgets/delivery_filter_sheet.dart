import 'package:delivery_app/widgets/bottom_buttons.dart';
import 'package:delivery_app/widgets/line_path.dart';
import 'package:delivery_app/widgets/routes_list.dart';
import 'package:delivery_app/widgets/section_separator.dart';
import 'package:flutter/material.dart';

class DeliveryFilterSheet extends StatefulWidget {
  @override
  _DeliveryFilterSheetState createState() => _DeliveryFilterSheetState();
}

class _DeliveryFilterSheetState extends State<DeliveryFilterSheet> {
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
                RoutesList(),
                Spacer(),
                BottomButtons(),
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
