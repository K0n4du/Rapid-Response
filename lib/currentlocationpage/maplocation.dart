// ignore_for_file: unused_local_variable, unused_element, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../appbase/navigation.dart';
import '../appbase/widgets/buttons.dart';
import '../appbase/widgets/commondetails.dart';

class MapLocation extends StatefulWidget {
  const MapLocation({super.key});

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  var locationMessage = '';

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    var lat = position.latitude;
    var long = position.longitude;

    setState(() {
      locationMessage = 'latitude: $lat, longitude: $long';
    });
  }

  void launchMap() async {
    try {
      var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      var lat = position.latitude;
      var long = position.longitude;

      String googleURL =
          'https://www.google.com/maps/search/?api=1&query=$lat,$long';
      await launch(googleURL);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Could not open the map.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _showDialogBox() async {
    {
      var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      var lat = position.latitude;
      var long = position.longitude;
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Report Incident from $lat,$long',
              style: myTextStyle,
            ),
            content: TextFormField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: 'Description',
                prefixIcon: const Icon(Icons.description_outlined),
                labelStyle: GoogleFonts.montserrat(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            actions: [
              ButtonsAlt(
                iconData: Icons.done,
                buttonText: 'Submit',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppNavigation()));
                  _popBox();
                },
              )
            ],
          );
        },
      );
    }
  }

  void _popBox() {
    showDialog(
        context: context,
        builder: (BuildContext) {
          Timer(const Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
          return const AlertDialog(
            title: Image(image: AssetImage('assets/Success.png')),
            content: Text('Request Sent!'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppNavigation(),
                ),
              );
            },
            icon: const Icon(
              Icons.home_filled,
              size: 30,
              color: Colors.red,
            )),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mapp.webp'),
            fit: BoxFit.cover,
            opacity: 0.25,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                size: 50,
                color: myButtonColor,
              ),
              const Pading(),
              Text(
                locationMessage,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ButtonsAlt(
                  iconData: Icons.location_on,
                  buttonText: 'Get Location',
                  onPressed: () {
                    getCurrentLocation();
                  }),
              const Pading(),
              ButtonsAlt(
                iconData: Icons.map_rounded,
                buttonColor: Colors.green,
                buttonText: 'Submit Report',
                onPressed: () {
                  _showDialogBox();
                },
              ),
              const Pading(),
              FloatingActionButton(
                onPressed: launchMap,
                child: Icon(Icons.my_location_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
