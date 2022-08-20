import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/rows.dart';
import 'package:geolocator/geolocator.dart';

import '../util/location.dart';

class locationsProvider extends ChangeNotifier {
  final List _locations = <LocationRow>[
    LocationRow(),
    LocationRow(),
    LocationRow(),
    LocationRow(),
  ];

  List get locations => _locations;

  //add new location
  addLocation() {
    _locations.add(LocationRow());
    notifyListeners();
  }

  // function for updating location
  updateLocation(index) async {
    Position location = await determinePosition();

  // introduce randonmess into location values
    double lat = location.latitude * Random().nextDouble();
    double lng = location.longitude * Random().nextDouble();

    _locations[index].longitude = lng.toStringAsPrecision(5);
    _locations[index].latitude = lat.toStringAsPrecision(5);

    notifyListeners();
  }

// delete a location
  deleteLocation(index) {
    _locations.removeAt(index);
    notifyListeners();
  }
}
