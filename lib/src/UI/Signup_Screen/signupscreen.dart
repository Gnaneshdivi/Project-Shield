// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:shield/src/blocs/authservices.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  late String phoneNo,
      verificationId,
      smsCode = "******",
      adhar = '',
      name = '';

  bool codeSent = false;
  bool loading = false;
  late Timer _timer;
  int _start = 30;
  late final PhoneVerificationCompleted verified;
  Future<void> signupwithtimer() async {
    await AuthService()
        .signInWithOTP(smsCode, verificationId, phoneNo, adhar, name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                "LOGIN",
                style: TextStyle(
                    color: Color.fromRGBO(143, 148, 251, 1),
                    fontSize: MediaQuery.of(context).size.width * 0.09),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/women.png'))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      this.adhar = value;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "ADHAR NUMBER",
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        // ignore: prefer_const_constructors
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      this.name = value;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "NAME",
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        this.phoneNo = value;
                      });
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone number",
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      const BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: codeSent
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    "Enter OTP",
                                    style: TextStyle(
                                        color: Color.fromRGBO(143, 148, 251, 1),
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.35),
                                    child: Text(
                                      "$_start " + "Seconds",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          OTPTextField(
                            length: 6,
                            width: MediaQuery.of(context).size.width * 0.8,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldWidth: MediaQuery.of(context).size.width * 0.1,
                            fieldStyle: FieldStyle.box,
                            outlineBorderRadius: 15,
                            style: TextStyle(fontSize: 17, color: Colors.black),
                            onChanged: (pin) {
                              print("Changed: " + pin);
                              this.smsCode = pin;
                            },
                            onCompleted: (pin) {
                              print("Completed: " + pin);
                              this.smsCode = pin;
                            },
                          ),
                        ],
                      )
                    : Container(),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    print('pressed');
                    codeSent
                        ? signupwithtimer()
                        : {verifyPhone(phoneNo), startTimer()};
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ])),
                    child: Center(
                        child: codeSent
                            ? const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            : const Text(
                                'Verify',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        )));
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (_start == 0) {
          if (mounted) {
            setState(() {
              timer.cancel();
            });
          }
        } else {
          if (mounted) {
            setState(() {
              _start--;
            });
          }
        }
      },
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    // ignore: prefer_function_declarations_over_variables
    verified = (AuthCredential authResult) {
      AuthService().signIn(authResult, phoneNo, adhar, name);
    };

    // ignore: prefer_function_declarations_over_variables
    final PhoneVerificationFailed verificationfailed = (e) {
      print('${e.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    } as PhoneCodeSent;

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${phoneNo}",
        timeout: const Duration(seconds: 30),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
