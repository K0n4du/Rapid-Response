import 'package:flutter/material.dart';
import 'package:rapidresponse/currentlocationpage/maplocation.dart';

import '../../appbase/widgets/buttons.dart';

class EmergencyServices extends StatelessWidget {
  const EmergencyServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: [
        Cardbutton(
          text: 'Incident\nReporting',
          image: 'assets/reporting.png',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MapLocation(),
              ),
            );
          },
        ),
        Cardbutton(
            text: 'Maps and\nNavigation',
            image: 'assets/navigator.png',
            onPressed: () {}),
        Cardbutton(
            text: 'Safety tips\nand Guidelines',
            image: 'assets/Safety Image.png',
            onPressed: () {}),
      ],
    );
  }
}
