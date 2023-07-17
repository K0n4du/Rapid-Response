import 'package:flutter/material.dart';

import '../../appbase/widgets/commondetails.dart';
import '../homewidget/emergencycontactcard.dart';
import '../homewidget/emergencyservices.dart';
import '../homewidget/homepagewidget.dart';
import '../homewidget/newsupdatecard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: myBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: [
              const Pading(),
              const HomeSearch(),
              const Pading(),
              const EmergencyContactCard(),
              const ViewMore(),
              const EmergencyServices(),
              const Pading(),
              Text(
                'Get Updated',
                style: myTextStyle,
              ),
              const Pading(),
              const NewsUpdatesCard(),
            ],
          ),
        ),
      ),
    );
  }
}
