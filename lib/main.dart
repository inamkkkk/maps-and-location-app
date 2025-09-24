import 'package:flutter/material.dart';
import 'package:maps_location_app/screens/map_screen.dart';
import 'package:provider/provider.dart';
import 'package:maps_location_app/services/location_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => LocationService(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps and Location App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapScreen(),
    );
  }
}