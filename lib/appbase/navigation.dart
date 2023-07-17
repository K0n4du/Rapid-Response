import 'package:flutter/material.dart';
import 'package:rapidresponse/appbase/widgets/buttons.dart';
import 'package:rapidresponse/infopage/infopage.dart';

import '../emergencyservices/emergencyservicepage.dart';
import '../homepage/code/homepagecode.dart';
import 'widgets/commondetails.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const EmergencyServicesPage(),
    const InfoPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Rapid Response',
          style: myTextStyle,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined),
                color: myButtonColor,
              ),
              UserAccountWidget()
            ],
          )
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}
