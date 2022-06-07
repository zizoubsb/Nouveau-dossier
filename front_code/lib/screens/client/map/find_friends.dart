import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:blogapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindFriends extends StatefulWidget {
  const FindFriends({Key? key}) : super(key: key);

  @override
  _FindFriendsState createState() => _FindFriendsState();
}

class _FindFriendsState extends State<FindFriends> {
  static const CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  late GoogleMapController mapController;

  final Set<Marker> markers = {};
  final LatLng _center = const LatLng(36, 6);
  late LatLng lastPosition;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps View'),
        backgroundColor: C_3,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: markers,
        onLongPress: (LatLng pos) {
          _setPosition(pos);
          print(pos);
        },
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(_center.toString()),
        position: _center, //position of marker
        infoWindow: const InfoWindow(
          anchor: Offset(0.5, 0.0),
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        anchor: Offset(0.5, 0.0),
        markerId: MarkerId(_center.toString()),
        position: LatLng(35.0099116, 6.3132343), //position of marker
        infoWindow: InfoWindow(
          //popup info
          anchor: Offset(0.5, 0.0),
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }

  _setPosition(LatLng pos) {
    lastPosition = pos;

    setState(() {
      markers.clear();
      markers.add(Marker(
        markerId: MarkerId(pos.toString()),
        position: pos,
        infoWindow: const InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });
  }
}
