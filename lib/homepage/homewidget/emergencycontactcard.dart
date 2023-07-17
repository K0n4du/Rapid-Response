// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../appbase/widgets/buttons.dart';
import '../../appbase/widgets/commondetails.dart';

class EmergencyContactCard extends StatelessWidget {
  final String phoneNumber = '0554893738';
  const EmergencyContactCard({
    super.key,
  });
  void makeCall(BuildContext context) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    final String urlString = phoneUri.toString();
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Could not make call'),
            actions: [
              ButtonsAlt(
                iconData: Icons.done,
                buttonText: 'OK',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Image(
              image: AssetImage('assets/emergencycontact.png'),
            ),
            const Pading(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emergency\nContact',
                  style: myTextStyle.copyWith(
                      fontSize: 20, color: myforegroundColor),
                ),
                const Pading(),
                Buttons(
                  iconData: Icons.call,
                  buttonText: 'Call Now',
                  onPressed: () {
                    makeCall(context);
                  },
                  buttonColor: myforegroundColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
