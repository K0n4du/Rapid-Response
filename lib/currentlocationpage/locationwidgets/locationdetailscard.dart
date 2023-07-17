import 'package:flutter/material.dart';

import '../../appbase/widgets/buttons.dart';
import '../../appbase/widgets/commondetails.dart';

class LocationDetailsCard extends StatelessWidget {
  const LocationDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: myforegroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ListTile(
            leading: Icon(
              Icons.location_on,
              color: Colors.yellow,
            ),
            title: Text('location'),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: ButtonsAlt(
                iconData: Icons.my_location,
                buttonText: 'Set Location',
                onPressed: () {}),
          )
        ],
      ),
    ));
  }
}