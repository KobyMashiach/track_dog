import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:google_maps_webservice/places.dart';

class AddressPickerWidget extends StatefulWidget {
  final Function(String address, LatLng location) onAddressSelected;

  const AddressPickerWidget({Key? key, required this.onAddressSelected})
      : super(key: key);

  @override
  _AddressPickerWidgetState createState() => _AddressPickerWidgetState();
}

class _AddressPickerWidgetState extends State<AddressPickerWidget> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  String? _selectedAddress;

  final _initialPosition = const LatLng(37.7749, -122.4194);
  // final _places = GoogleMapsPlaces(apiKey: "YOUR_API_KEY");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter address',
            suffixIcon: Icon(Icons.search),
          ),
          onTap: () async {
            // Prediction? prediction = await PlacesAutocomplete.show(
            //   context: context,
            //   apiKey: 'YOUR_API_KEY',
            //   mode: Mode.overlay,
            //   language: "en",
            //   components: [
            //     Component(Component.country, "us")
            //   ], // Adjust based on your needs
            // );
            // if (prediction != null) {
            //   _displayPrediction(prediction);
            // }
          },
        ),
        SizedBox(
          height: 300,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _initialPosition, zoom: 12),
            onMapCreated: (controller) => _mapController = controller,
            onTap: _onMapTapped,
            markers: _selectedLocation != null
                ? {
                    Marker(
                      markerId: MarkerId("selected-location"),
                      position: _selectedLocation!,
                    ),
                  }
                : {},
          ),
        ),
        if (_selectedAddress != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Selected Address: $_selectedAddress'),
          ),
      ],
    );
  }

  Future<void> _onMapTapped(LatLng position) async {
    setState(() {
      _selectedLocation = position;
    });
    await _getAddressFromLatLng(position);
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      setState(() {
        _selectedAddress = placemarks.first.street;
        widget.onAddressSelected(_selectedAddress!, position);
      });
    }
  }

  // Future<void> _displayPrediction(Prediction prediction) async {
  //   PlacesDetailsResponse detail =
  //       await _places.getDetailsByPlaceId(prediction.placeId!);
  //   final lat = detail.result.geometry!.location.lat;
  //   final lng = detail.result.geometry!.location.lng;

  //   LatLng selectedPosition = LatLng(lat, lng);
  //   setState(() {
  //     _selectedLocation = selectedPosition;
  //     _selectedAddress = detail.result.formattedAddress;
  //     _mapController?.animateCamera(CameraUpdate.newLatLng(selectedPosition));
  //   });

  //   widget.onAddressSelected(_selectedAddress!, selectedPosition);
  // }
}
