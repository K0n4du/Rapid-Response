import 'package:flutter/material.dart';

import '../../appbase/widgets/buttons.dart';
import '../../appbase/widgets/commondetails.dart';
import '../../appbase/widgets/inputwidget.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const InputText(
      labelText: 'Search',
      iconData: Icons.search_outlined,
      color: Color.fromRGBO(249, 168, 77, 0.2),
    );
  }
}

class ViewMore extends StatelessWidget {
  const ViewMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Emergency Services',
          style: myTextStyle,
        ),
        const Spacer(),
        TButton(
          text: 'View More',
          onPressed: () {},
        )
      ],
    );
  }
}
