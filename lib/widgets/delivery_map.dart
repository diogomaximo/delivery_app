import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class DeliveryMap extends StatefulWidget {
  @override
  _DeliveryMapState createState() => _DeliveryMapState();
}

class _DeliveryMapState extends State<DeliveryMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kSanFrancisco = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 13.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: _kSanFrancisco,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        });
  }
}
