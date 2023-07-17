import 'package:flutter/material.dart';
import 'package:rapidresponse/appbase/widgets/buttons.dart';
import 'package:rapidresponse/appbase/widgets/commondetails.dart';
import 'package:rapidresponse/currentlocationpage/maplocation.dart';

class EmergencyServicesPage extends StatefulWidget {
  const EmergencyServicesPage({super.key});

  @override
  State<EmergencyServicesPage> createState() => _EmergencyServicesPageState();
}

class _EmergencyServicesPageState extends State<EmergencyServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myBackgroundColor,
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            Cardbutton(
              text: 'Incident\nResponse',
              image: 'assets/reporting.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapLocation(),
                  ),
                );
              },
            ),
            Cardbutton(
              text: 'Real Time\nUpdates',
              image: 'assets/reporting.png',
              onPressed: () {},
            ),
            Cardbutton(
              text: 'Safety\nGuidlines',
              image: 'assets/Safety Image.png',
              onPressed: () {},
            ),
            Cardbutton(
              text: 'Maps and\nNavigation',
              image: 'assets/navigator.png',
              onPressed: () {},
            ),
            Cardbutton(
              text: 'Training',
              image: 'assets/navigator.png',
              onPressed: () {},
            )
          ],
        ));
  }
}
