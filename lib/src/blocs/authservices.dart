import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shield/src/UI/Home_Screen/dashboardscreen.dart';
import 'package:shield/src/UI/Signup_Screen/signupscreen.dart';

class AuthService {
  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return DashboardPage();
          } else {
            return LoginPage();
          }
        });
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds, phoneNo, adhar, name) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
    FirebaseFirestore.instance
        .collection('Users')
        .add({"phone": '$phoneNo', "adharno": '$adhar', "name": '$name'});
  }

  signInWithOTP(smsCode, verId, phoneNo, adhar, name) {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    signIn(authCreds, phoneNo, adhar, name);
  }
}
