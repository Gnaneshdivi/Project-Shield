import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shield/src/blocs/locationservices.dart';
import 'package:shield/src/blocs/logs.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

bool turbo = true;

class _MainScreenState extends State<MainScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Services().getlocation(
              turbo ? Duration(seconds: 5) : Duration(seconds: 60)),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  turbo ? turbo = false : turbo = true;
                });
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: !turbo
                      ? LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ])
                      : LinearGradient(colors: [
                          Colors.red,
                          Colors.orange,
                        ]),
                ),
                child: Center(
                    child: turbo
                        ? const Text(
                            'Turbo Mode On',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        : const Text(
                            'Turbo Mode Off',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
