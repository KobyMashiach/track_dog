import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:track_dog/widgets/general/appbar.dart';

class AddressPickerWidget extends StatefulWidget {
  const AddressPickerWidget({super.key});

  @override
  State<AddressPickerWidget> createState() => _MyAppState();
}

class _MyAppState extends State<AddressPickerWidget> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.86, 151.20);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "Map example"),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
