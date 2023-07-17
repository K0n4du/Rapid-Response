import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pading extends StatelessWidget {
  const Pading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.all(7.0));
  }
}

TextStyle myTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: GoogleFonts.montserrat().fontFamily,
);
TextStyle myTextStyleAlt = TextStyle(
  color: myButtonColorAlt,
  fontFamily: GoogleFonts.montserrat().fontFamily,
);

const myBackgroundColor = Color.fromRGBO(240, 240, 250, 1);

const myforegroundColor = Color.fromRGBO(254, 254, 255, 1);

const myButtonColor = Color.fromRGBO(183, 0, 10, 1);

const myButtonColorAlt = Color.fromRGBO(254, 254, 255, 1);

const myTextFieldColor = Color.fromRGBO(249, 168, 77, 0.2);
