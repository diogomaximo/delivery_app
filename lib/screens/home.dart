import 'package:delivery_app/widgets/delivery_filter_sheet.dart';
import 'package:delivery_app/widgets/delivery_map.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/widgets/delivery_filter_sheet.dart';

GlobalKey<DeliveryFilterSheetState> globalKey = GlobalKey();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedRoute;
  String viewMode = "Map";

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        DeliveryMap((routeId){
          setState(() {
            selectedRoute = routeId;
            viewMode = "List";
            globalKey.currentState.changeViewMode(routeId);
          });
        }),
        Positioned(bottom: 0, child:DeliveryFilterSheet(selectedRoute, viewMode, key: globalKey,) )
      ],
    );
  }
}

