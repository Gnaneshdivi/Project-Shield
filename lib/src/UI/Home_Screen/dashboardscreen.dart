import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shield/src/blocs/authservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../blocs/hardwarevuttons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var _currentIndex = 1;
  List<Widget> bodydata = [
    Center(
      child: Text(
        'POlice',
        style: TextStyle(color: Colors.black),
      ),
    ),
    Center(
      child: Text('home', style: TextStyle(color: Colors.black)),
    ),
    Center(
      child: Text('contacts', style: TextStyle(color: Colors.black)),
    ),
    Center(
      child: Text('profile', style: TextStyle(color: Colors.black)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: bodydata[_currentIndex],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: SalomonBottomBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          selectedColorOpacity: 0.3,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.grade_rounded),
              title: Text("Police"),
              selectedColor: Colors.blue,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.yellow,
            ),

            /// Search
            SalomonBottomBarItem(
                icon: Icon(Icons.contacts),
                title: Text("Contacts"),
                selectedColor: Colors.orange),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
