import 'dart:async';

import 'package:car_wash/constants.dart';
import 'package:car_wash/model/transaction_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Body extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Body> {
  // Current selected
  int current = 0;

  @override
  Widget build(BuildContext context) {
    // 1
    Completer<GoogleMapController> _controller = Completer();
    // 2
    final CameraPosition _myLocation = CameraPosition(
      target: LatLng(0, 0),
    );
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Center(
            child: new Text(
          "Map",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade700),
        )),
      ),
      // 1
      body: GoogleMap(
        // 2
        initialCameraPosition: _myLocation,
        // 3
        mapType: MapType.normal,
        // 4
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
