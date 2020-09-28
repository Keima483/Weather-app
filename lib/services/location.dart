import 'dart:io';

import 'package:geolocator/geolocator.dart';

class Location {

  double latitude ;
  double longitude ;

  Future<void> getCurrentLocation() async {

    try {
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.low) ;
      this.latitude = position.latitude ;
      this.longitude = position.longitude ;
    } catch(e) {
      exit(0) ;
    }
  }
}