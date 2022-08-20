import 'dart:math';

import 'package:flutter_application_1/util/location.dart';
import 'package:geolocator/geolocator.dart';

class LocationRow {
  String? longitude;
  String? latitude;

  LocationRow({
    this.latitude = '',
    this.longitude = '',
  });

  // updateLocation() async {
  //   Position location = await determinePosition();
  //   double lat = location.latitude * Random().nextDouble();
  //   double lng = location.longitude * Random().nextDouble();

  //   longitude = lng.toStringAsPrecision(5);
  //   latitude = lat.toStringAsPrecision(5);
  // }
}
