import 'dart:async';
import 'dart:math';
import 'package:digitalkaimur/src/main/ui/widgets/map_box_widget.dart';
import 'package:digitalkaimur/src/res/app_screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MapStore extends StatefulWidget {
  @override
  State<MapStore> createState() => MapStoreState();
}

class MapStoreState extends State<MapStore> {
  Completer<GoogleMapController> _mapController = Completer();
  double zoomVal = 5.0;

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long), zoom: 15, tilt: 50.0,
      bearing: 45.0,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _googleMapWidget(context),
            _zoomminusfunction(),
            _zoomplusfunction(),
            _buildContainer(),
          ],
        )
    );
  }

  Widget _googleMapWidget(BuildContext context) {
    return Container(
      height: AppSize.height(context),
      width: AppSize.width(context),
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(12.931585, 77.678729), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _mapController.complete(controller);
        },
        markers: {
          setMarker,
          setMarker1
        },
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [

            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MapBox(
                  onTap: () {
                    _gotoLocation(12.931585, 77.678729);
                  },
                  avatar: "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  lat: 40.738380, lng: -73.988426, name: "Gramercy Tavern"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MapBox(
                  onTap: () {
                    _gotoLocation(12.932266, 77.684373);
                  },
                  avatar: "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  lat: 40.761421, lng: -73.981667, name: "Le Bernardin"),
            ),


          ],
        ),
      ),
    );
  }


  Marker setMarker = Marker(
    markerId: MarkerId('mkk'),
    position: LatLng(12.931585, 77.678729),
    infoWindow: InfoWindow(title: 'Orchid Leak View'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );

  Marker setMarker1 = Marker(
    markerId: MarkerId('mkk'),
    position: LatLng(12.932266, 77.684373),
    infoWindow: InfoWindow(title: 'Sakra Hospital'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueAzure,
    ),
  );


  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }


}




/*  final CameraPosition _initialPosition =
      CameraPosition(target: LatLng(12.931585, 77.678729),zoom: 12.0);


  GoogleMapController _mapController;
  int id = Random().nextInt(100);
  final List<Marker> marker = [];

  addMarker(cordinate) {
    int id = Random().nextInt(100);
    setState(() {
      marker
          .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GoogleMap(
      initialCameraPosition: _initialPosition,
      mapType: MapType.normal,
      onMapCreated: (controller) {
        setState(() {
          _mapController = controller;
        });
      },
      markers: marker.toSet(),
      onTap: (cordinate) {
        _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
        addMarker(cordinate);
      },
    ));
  }
}*/

/* Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.931585, 77.678729),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(12.931585, 77.678729),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}*/
