import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:minggu10/data_dummy.dart';
import 'package:minggu10/map_type_google.dart';

class MapsV1Page extends StatefulWidget {
  const MapsV1Page({super.key});

  @override
  State<MapsV1Page> createState() => _MapsV1PageState();
}

class _MapsV1PageState extends State<MapsV1Page> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  double latitude = -7.2804494;
  double longitude = 112.79447228;

  var mapType = MapType.normal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps v1"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return googleMapTypes.map((typeGoogle) {
                return PopupMenuItem(
                  value: typeGoogle.type,
                  child: Text(typeGoogle.type.name),
                );
              }).toList();
            },
            onSelected: onSelectedMapType,
          )
        ],
      ),
      body: Stack(
        children: [
          _buildGoogleMaps(),
        ],
      ),
    );
  }

  Widget _buildGoogleMaps() {
    return GoogleMap(
      mapType: mapType,
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 14,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: markers,
    );
  }

  void onSelectedMapType(Type value) {
    setState(() {
      switch (value) {
        case Type.normal:
          mapType = MapType.normal;
          break;
        case Type.hybrid:
          mapType = MapType.hybrid;
          break;
        case Type.terrain:
          mapType = MapType.terrain;
          break;
        case Type.satellite:
          mapType = MapType.satellite;
          break;
        default:
      }
    });
  }
}
