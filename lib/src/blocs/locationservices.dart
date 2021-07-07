import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Services {
  void distancebetween(la1, la2, lo1, lo2) {
    double distanceInMeters = Geolocator.distanceBetween(la1, lo1, la2, lo2);
  }

  getlocation(Duration intervel) {
    return StreamBuilder(
        stream: Geolocator.getPositionStream(
          intervalDuration: intervel,
          desiredAccuracy: LocationAccuracy.best,
        ),
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          return Text(
            " ${snapshot.data}",
            style: TextStyle(fontSize: 20, color: Colors.black),
          );
        });
  }
}
