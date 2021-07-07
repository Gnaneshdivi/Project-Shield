import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class Logs {
  void bluetooth() {
    print('helo');
    FlutterBlue flutterBlue = FlutterBlue.instance;
    Timer.periodic(const Duration(seconds: 30), (Timer) {
      flutterBlue.startScan(timeout: Duration(seconds: 4));
    });

    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      print('results');
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.device}');
      }
    });
    flutterBlue.stopScan();
  }
}
