import 'package:flutter/material.dart';

import '../../appbase/widgets/commondetails.dart';

class UpperImage extends StatelessWidget {
  const UpperImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            const Image(
              image: AssetImage('assets/lighthouse.png'),
            ),
            const Pading(),
            Text(
              'Rapid Response',
              style: myTextStyle.copyWith(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
