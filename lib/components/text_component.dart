import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/constants/constants.dart';

// ignore: must_be_immutable
class TextComponent extends StatelessWidget {
  String title;
  double fontSize;
  String textColor;
  TextComponent({this.fontSize, this.textColor, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          color: HexColor(textColor),
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
