import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../appbase/widgets/buttons.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  // ignore: non_constant_identifier_names
  final MyUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ListDetails(
          titletext: 'Name',
          iconData: Icons.person,
          username: MyUser.displayName ?? '',
        ),
        const Divider(),
        ListDetails(
          titletext: 'Email',
          iconData: Icons.email,
          username: MyUser.email ?? '',
        ),
      ],
    ));
  }
}
