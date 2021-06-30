import 'package:flutter/material.dart';
import 'package:shield/src/UI/Intro_Screen/intro_screen.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
