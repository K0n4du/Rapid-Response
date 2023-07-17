import 'package:flutter/material.dart';
import 'package:rapidresponse/loginpage/loginwidgets/upperimage.dart';
import 'package:rapidresponse/services/authentication.dart';

import '../appbase/widgets/buttons.dart';
import '../appbase/widgets/commondetails.dart';

class SignUp extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final toggleView;
  const SignUp({Key? key, this.toggleView}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const UpperImage(),
              TextFormField(
                onChanged: (val) {
                  setState(() => username = val);
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
                decoration: Decoration('Name', Icons.person_outline),
              ),
              const Pading(),
              //
              //
              //
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
                onChanged: (val) {
                  setState(() => password = val);
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'The password is wrong';
                  }
                  return null;
                },
                decoration: Decoration('Password', Icons.lock_outlined),
              ),
              const Pading(),
              ButtonsAlt(
                  iconData: Icons.account_box_outlined,
                  buttonText: 'Create Account',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result =
                          await _auth.register(email, password, username);
                      if (result == null) {
                        setState(
                            () => error = 'please enter valid credentials');
                      }
                    }
                  }),
              SwitchButtons(
                  labeltext: 'Already a user? SIGN IN', widget: widget)
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
