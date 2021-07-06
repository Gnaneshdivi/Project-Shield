import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void distancebetween(la1, la2, lo1, lo2) {
  double distanceInMeters = Geolocator.distanceBetween(la1, lo1, la2, lo2);
}
