import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shield/src/blocs/authservices.dart';
import 'package:location/location.dart';
import '../src/blocs/logs.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<Position> positionStream =
      Geolocator.getPositionStream().listen((Position position) {
    print(position == null
        ? 'Unknown'
        : position.latitude.toString() + ', ' + position.longitude.toString());
  });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Logs().bluetooth();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: AuthService().handleAuth(),
    );
  }
}
