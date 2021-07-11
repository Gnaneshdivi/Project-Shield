import 'package:flutter/material.dart';
import 'package:shield/src/blocs/authservices.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: RaisedButton(
        child: Text('Signout'),
        onPressed: () {
          AuthService().signOut();
        },
      )),
    );
  }
}
