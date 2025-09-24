import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:maps_location_app/services/location_service.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    Provider.of<LocationService>(context, listen: false).getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final locationService = Provider.of<LocationService>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Map')),//locationService.currentLocation != null ? 'Map ${locationService.currentLocation!.latitude}, ${locationService.currentLocation!.longitude}' : 'Map'),
      body: locationService.currentLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(locationService.currentLocation!.latitude, locationService.currentLocation!.longitude),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: { Marker(markerId: const MarkerId('current_location'), position: LatLng(locationService.currentLocation!.latitude, locationService.currentLocation!.longitude))},
            ),
      floatingActionButton:
         FloatingActionButton.extended(
        onPressed: () async{
          Position newPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(newPosition.latitude, newPosition.longitude), 
            zoom: 14.4746
            )
          ));
          locationService.updateLocation(newPosition);
        },
        label: const Text('Get Location'),
        icon: const Icon(Icons.location_on),
      ),
    );
  }
}