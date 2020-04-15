import 'dart:async';
import 'dart:ffi';
import 'package:delivery_app/widgets/bottom_buttons.dart';
import 'package:delivery_app/widgets/route_details.dart';
import 'package:delivery_app/widgets/routes_list.dart';
import 'package:flutter/material.dart';

class DeliveryFilterSheet extends StatefulWidget {

  String selectedRoute = "1";

  DeliveryFilterSheet(this.selectedRoute);

  @override
  _DeliveryFilterSheetState createState() => _DeliveryFilterSheetState();
}

class _DeliveryFilterSheetState extends State<DeliveryFilterSheet> {
  double height = 140;
  bool isAnimating = true;
  bool isMapView = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      setState(() {
        height = 310; //840
        isAnimating = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: mainContainerDecoration(),
      height: height,
      width: MediaQuery.of(context).size.width,
      duration: Duration(milliseconds: 920),
      curve: Curves.fastOutSlowIn,
      onEnd: () {
        setState(() {
          isAnimating = false;
        });
      },
      child: Column(
        children: listOfWidgets(),
      ),
    );
  }

  List<Widget> listOfWidgets() {
    if (isAnimating) {
      return [
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
      ];
    }
    return [
      RoutesList((routeString) {
        setState(() {
          height = 720;
          isMapView = false;
        });
      }, widget.selectedRoute),
      (isMapView ? SizedBox.shrink() : RouteDetails()),
      Spacer(),
      BottomButtons((selectedOption) {
        setState(() {
          isMapView = selectedOption == "Map";
          height = isMapView ? 310 : 840;
        });
      })
    ];
  }

  BoxDecoration mainContainerDecoration() {
    return BoxDecoration(
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
            ]));
  }
}
