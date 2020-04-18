import 'dart:typed_data';

import 'package:delivery_app/widgets/marker_generator.dart';
import 'package:delivery_app/widgets/rounded_button.dart';
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


  String selectedButton = "";
  Set<Marker> markers = Set();

  void initState(){
    super.initState();
    generate();
  }

  void generate(){
    MarkerGenerator(markerWidgets(), (bitmaps) {
      setState(() {
        markers = mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kSanFrancisco = CameraPosition(
    target: LatLng(37.745973, -122.414299),
   zoom: 13.4746,
  );


  Set<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    Set<Marker> markersList = Set();
    bitmaps.asMap().forEach((i, bmp) {
      final city = cities[i];
      markersList.add(Marker(
          consumeTapEvents: false,
          onTap: (){
            widget.onMapSelected(city.name);
            setState(() {
              selectedButton = city.name;
            });
            generate();

          },
          markerId: MarkerId(city.name),
          position: city.position,
          icon: BitmapDescriptor.fromBytes(bmp)));
    });
    return markersList;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: _kSanFrancisco,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        });
  }

  Widget _getMarkerWidget(String name) {
    Color backgroundColor = Color.fromRGBO(88, 32, 190, 1);
    Color backColor = Color.fromRGBO(125, 202, 237, 1);
    double width = name.length == 1 ? 54 : 80 ;
    bool isSelectedButtom = (name == selectedButton);
    if (isSelectedButtom){
      backColor = Color.fromRGBO(111, 42, 244, 1);
    }
    return AnimatedContainer(
      duration: Duration(seconds: 1),
        width: width,
        height: 54,
        child: FlatButton(
          onPressed: () {},
          color: backColor,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20),
              side: BorderSide(color: Colors.white, width: 1)),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),

        ));
  }

  List<Widget> markerWidgets() {
    return cities.map((c) => _getMarkerWidget(c.name)).toList();
  }

}



// Example of backing data
List<City> cities = [
  City("1", LatLng(37.769893, -122.414600)),
  City("2-3", LatLng(37.766365, -122.423870)),
  City("4", LatLng(37.762259, -122.425543)),
  City("5", LatLng(37.753438, -122.414042)),
  City("6", LatLng(37.756899, -122.410008)),
  City("7", LatLng(37.753166, -122.424427)),
  City("8", LatLng(37.773703, -122.411923)),
];

class City {
  final String name;
  final LatLng position;

  City(this.name, this.position);
}
