/*import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindFriends1 extends StatefulWidget {
  const FindFriends1({Key? key}) : super(key: key);

  @override
  _FindFriends1State createState() => _FindFriends1State();
}

class _FindFriends1State extends State<FindFriends1> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final Set<Marker> _markers = {};


  // ignore: prefer_final_fields
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final List<dynamic> _contacts = [
    {
      "name": "Offer tittle",
      "position": LatLng(37.42796133580665, -122.085749655962),

      "image": 'assets/images/avatar-1.png',
      "descripton": "descripton 1 aktab hna wach 7abit",
    },
    
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    createMarkers(context);
    */
    /*
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailPage extends StatelessWidget {
  final dynamic post;
  final List<dynamic> _contacts = [
    {
      "name": "Offer tittle",
      "position": LatLng(37.42796133580665, -122.085749655962),
      "image": 'assets/images/avatar-1.png',
      "descripton": "descripton 1 aktab hna wach 7abit",
    },
  ];

  DetailPage({Key? key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    createMarkers(context);
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
            initialCameraPosition: _kGooglePlex,
            markers: _markers,
            myLocationButtonEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onTap: (LatLng latLng) {
              _customInfoWindowController.hideInfoWindow!();
            }),
        CustomInfoWindow(
          controller: _customInfoWindowController,
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.8,
          offset: 60.0,
        ),
      ],
    ));
  }

  createMarkers(BuildContext context) {
    Marker marker;
    _contacts.forEach((contact) async {
      marker = Marker(
        markerId: MarkerId(contact['name']),
        position: contact['position'],
        infoWindow: InfoWindow(),
      );

      setState(() {
        _markers.add(marker);
      });
    });
  }

  Future<BitmapDescriptor> _getAssetIcon(
      BuildContext context, String icon) async {
    final Completer<BitmapDescriptor> bitmapIcon =
        Completer<BitmapDescriptor>();
    final ImageConfiguration config =
        createLocalImageConfiguration(context, size: Size(5, 5));

    AssetImage(icon)
        .resolve(config)
        .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
      final ByteData? bytes =
          await image.image.toByteData(format: ImageByteFormat.png);
      final BitmapDescriptor bitmap =
          BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
      bitmapIcon.complete(bitmap);
    }));

    return await bitmapIcon.future;
  }
}*/


    /**/
