import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'commondetails.dart';

class InputText extends StatelessWidget {
  final String labelText;
  final IconData iconData;
  final Color color;

  const InputText(
      {Key? key,
      required this.labelText,
      required this.iconData,
      this.color = myforegroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(iconData),
        filled: true,
        fillColor: color,
        labelStyle: GoogleFonts.montserrat(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
