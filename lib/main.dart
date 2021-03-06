import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './src/app.dart';

// @dart=2.9
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
