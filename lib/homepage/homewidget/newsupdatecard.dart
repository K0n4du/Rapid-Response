import 'package:flutter/material.dart';

import '../../appbase/widgets/commondetails.dart';

class NewsUpdatesCard extends StatelessWidget {
  const NewsUpdatesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Image(
              image: AssetImage('assets/updates.png'),
            ),
            const Pading(),
            Text(
              'Get all your news about\nsecurity updates here',
              style: myTextStyle.copyWith(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
