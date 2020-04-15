import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class DeliveryMap extends StatefulWidget {

  Function onMapSelected;

  DeliveryMap(this.onMapSelected);

  @override
  _DeliveryMapState createState() => _DeliveryMapState();
}

class _DeliveryMapState extends State<DeliveryMap> {

  Set<Marker> markers = Set();

  void initState(){
    super.initState();
    Marker resultMarker = Marker(
      onTap: (){

        widget.onMapSelected("1");
        Marker resultMarker = Marker(
          onTap: (){
            widget.onMapSelected("2");
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          markerId: MarkerId("Place-2"),
          infoWindow: InfoWindow(
              title: "Title 01",
              snippet: "Info"),
          position: LatLng(37.769893, -122.414600),
        );
// Add it to Set
        markers.add(resultMarker);
      },
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      markerId: MarkerId("Place"),
      infoWindow: InfoWindow(
          title: "Title 01",
          snippet: "Info"),
      position: LatLng(37.766365, -122.423870),
    );
// Add it to Set
    markers.add(resultMarker);
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kSanFrancisco = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 13.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: _kSanFrancisco,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        });
  }
}
