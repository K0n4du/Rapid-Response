import 'package:flutter/material.dart';

import '../loginpage/login.dart';
import '../loginpage/signup.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showsignIn = true;
  void toggleView() {
    setState(() => showsignIn = !showsignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showsignIn) {
      return Loginpage(toggleView: toggleView);
    } else {
      return SignUp(toggleView: toggleView);
    }
  }
}
