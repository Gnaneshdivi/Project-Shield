import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shield/src/blocs/authservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../blocs/hardwarevuttons.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late StreamSubscription _volumeButtonSubscription;
  @override
  void initState() {
    super.initState();

    _volumeButtonSubscription =
        volumeButtonEvents!.listen((VolumeButtonEvent event) {
      print(event.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    // be sure to cancel on dispose
    _volumeButtonSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
      child: Text('Signout'),
      onPressed: () {
        AuthService().signOut();
      },
    )));
  }
}
