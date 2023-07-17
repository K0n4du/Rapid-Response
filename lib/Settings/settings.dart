// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rapidresponse/Settings/changepassword.dart';
import 'package:rapidresponse/Settings/changeusername.dart';
import 'package:rapidresponse/appbase/navigation.dart';
import 'package:rapidresponse/appbase/widgets/commondetails.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final MyUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.manage_accounts),
        title: Text(
          'SETTINGS',
          style: myTextStyleAlt,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppNavigation(),
                  ),
                );
              },
              icon: const Icon(Icons.home_filled))
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.drive_file_rename_outline_sharp),
            title: Text(
              'Chane Username',
              style: myTextStyle,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeUsernameForm(MyUser: MyUser),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.password_outlined),
            title: Text('Change Your Password', style: myTextStyle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangePasswordForm(MyUser: MyUser),
                ),
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
