import 'package:flutter/material.dart';

class RouteDetails extends StatefulWidget {

  @override
  _RouteDetailsState createState() => _RouteDetailsState();
}

class _RouteDetailsState extends State<RouteDetails> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        color: Colors.amber,
        width: MediaQuery.of(context).size.width,
        height: 750,
      ),
    );
  }
}
