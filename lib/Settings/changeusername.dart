// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../appbase/widgets/buttons.dart';
import '../appbase/widgets/commondetails.dart';
import 'settings.dart';

class ChangeUsernameForm extends StatefulWidget {
  final User MyUser;

  ChangeUsernameForm({required this.MyUser});

  @override
  _ChangeUsernameFormState createState() => _ChangeUsernameFormState();
}

class _ChangeUsernameFormState extends State<ChangeUsernameForm> {
  final _formKey = GlobalKey<FormState>();
  final _newUsernameController = TextEditingController();

  void _changeUsername() async {
    final currentUser = widget.MyUser;
    final newUsername = _newUsernameController.text;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .update({'name': newUsername});

    try {
      await currentUser.updateDisplayName(newUsername);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Username changed successfully.'),
            actions: [
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

      _newUsernameController.clear();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to change username.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.manage_accounts),
        title: Text(
          'Change Username',
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
                controller: _newUsernameController,
                decoration: Decoration(
                    'New Username', Icons.drive_file_rename_outline_outlined),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a new username.';
                  }
                  return null;
                },
              ),
              const Pading(),
              ButtonsAlt(
                iconData: Icons.done,
                buttonText: 'Change Username',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _changeUsername();
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
