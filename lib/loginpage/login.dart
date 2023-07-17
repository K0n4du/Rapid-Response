// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapidresponse/services/authentication.dart';

import '../appbase/widgets/buttons.dart';
import '../appbase/widgets/commondetails.dart';
import 'loginwidgets/logincontent.dart';
import 'loginwidgets/upperimage.dart';

class Loginpage extends StatefulWidget {
  final toggleView;
  const Loginpage({Key? key, this.toggleView}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  var child;
  bool _isObscure = true;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const UpperImage(),

              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                decoration: Decoration('Email', Icons.email_outlined),
              ),
              const Pading(),
              //
              //
              //
              TextFormField(
                obscureText: _isObscure,
                onChanged: (val) {
                  setState(() => password = val);
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'The password is wrong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility),
                  ),
                  filled: true,
                  fillColor: myTextFieldColor,
                  labelStyle: GoogleFonts.montserrat(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const Pading(),
              LoginContent(),
              ButtonsAlt(
                  iconData: Icons.login_outlined,
                  buttonText: 'Login',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.signIn(email, password);
                      if (result == null) {
                        setState(
                            () => error = 'please enter valid credentials');
                      }
                    }
                  }),
              SwitchButton(
                  labeltext: 'Don\'t have an Account? SIGN UP', widget: widget),
              Text(error)
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  InputDecoration Decoration(String labelText, IconData iconData) {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      labelText: labelText,
      labelStyle: myTextStyle,
      filled: true,
      fillColor: myTextFieldColor,
      prefixIcon: Icon(iconData),
    );
  }
}
