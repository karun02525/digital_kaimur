import 'dart:async';

import 'package:digitalkaimur/src/res/app_screen_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetCurrentLocation extends StatefulWidget {
  @override
  _GetCurrentLocationState createState() => _GetCurrentLocationState();
}

class _GetCurrentLocationState extends State<GetCurrentLocation> {
  LatLng _latLng;
  Completer<GoogleMapController> _mapController = Completer();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      isLoading=false;
      _latLng = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
           children: [
             _latLng==null?Container(child: Center(child: CupertinoActivityIndicator(radius: 20))):
             _googleMapWidget(context),

             Align(
               alignment: Alignment.bottomCenter,
               child: RaisedButton(
                 onPressed: (){ _getCurrentLocation();},
                 child: Text("Get"),
               ),
             )

           ],
    );

  }

  Widget _googleMapWidget(BuildContext context) {
    return Container(
      height: AppSize.height(context),
      width: AppSize.width(context),
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target:_latLng, zoom: 17),
        onMapCreated: (GoogleMapController controller) {
          _mapController.complete(controller);
        },
        markers:{Marker(position: _latLng,markerId: MarkerId('l'))},
      ),
    );
  }
}
