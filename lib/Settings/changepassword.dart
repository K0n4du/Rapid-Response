// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rapidresponse/Settings/settings.dart';
import 'package:rapidresponse/appbase/widgets/buttons.dart';

import '../appbase/widgets/commondetails.dart';

class ChangePasswordForm extends StatefulWidget {
  final User MyUser;

  ChangePasswordForm({required this.MyUser});

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _changePassword() async {
    final currentUser = widget.MyUser;
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content:
                const Text('New password and confirm password do not match.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      final authCredential = EmailAuthProvider.credential(
        email: currentUser.email!,
        password: currentPassword,
      );

      await currentUser.reauthenticateWithCredential(authCredential);
      await currentUser.updatePassword(newPassword);

      // Update the password in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .update({'password': newPassword});

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Password changed successfully.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      _currentPasswordController.clear();
      _newPasswordController.clear();
      _confirmPasswordController.clear();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Failed to change password. Please check your current password.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  var child;
  bool _isObscure = true;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.manage_accounts),
        title: Text(
          'Change Password',
          style: myTextStyleAlt,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
              icon: const Icon(Icons.undo))
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                obscureText: _isObscure,
                controller: _currentPasswordController,
                decoration: PasswordDecoration(
                  'Current Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your current password.';
                  }
                  return null;
                },
              ),
              const Pading(),
              TextFormField(
                obscureText: _isObscure,
                controller: _newPasswordController,
                decoration: PasswordDecoration('New Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a new password.';
                  }
                  return null;
                },
              ),
              const Pading(),
              TextFormField(
                obscureText: _isObscure,
                controller: _confirmPasswordController,
                decoration: PasswordDecoration('Confirm Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your new password.';
                  }
                  return null;
                },
              ),
              const Pading(),
              ButtonsAlt(
                iconData: Icons.done,
                buttonText: 'Change Password',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _changePassword();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration PasswordDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      prefixIcon: const Icon(Icons.lock_outlined),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _isObscure = !_isObscure;
          });
        },
        icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
      ),
      filled: true,
      fillColor: myTextFieldColor,
      labelStyle: GoogleFonts.montserrat(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
