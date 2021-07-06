import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class Logs {
  void bluetooth() {
    print('helo');
    FlutterBlue flutterBlue = FlutterBlue.instance;
    flutterBlue.startScan(timeout: Duration(seconds: 4));
    var subscription = flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });
    flutterBlue.stopScan();
  }
}
