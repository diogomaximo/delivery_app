import 'package:delivery_app/widgets/delivery_filter_sheet.dart';
import 'package:delivery_app/widgets/delivery_map.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String selectedRoute;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DeliveryMap((routeId){
          setState(() {
            selectedRoute = routeId;
          });
        }),
        Positioned(bottom: 0, child: DeliveryFilterSheet(selectedRoute))
      ],
    );
  }
}
