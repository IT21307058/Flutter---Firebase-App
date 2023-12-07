import 'package:firebase_auth_tutorial/screens/authentication/login.dart';
import 'package:firebase_auth_tutorial/screens/authentication/register.dart';
// import 'package:firebase_auth_tutorial/screens/authentication/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool signinPage = true;

  //toggle pages
  void switchPages() {
    setState(() {
      signinPage = !signinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signinPage == true) {
      return Sign_In(toggle: switchPages);
    } else {
      return Register(toggle: switchPages);
    }
  }
}
