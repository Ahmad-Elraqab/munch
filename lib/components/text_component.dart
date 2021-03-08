import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/constants/constants.dart';

// ignore: must_be_immutable
class TextComponent extends StatelessWidget {
  String title;
  double fontSize;
  String textColor;
  TextAlign align;
  FontWeight weight;
  TextComponent({
    this.fontSize,
    this.textColor,
    this.title,
    this.align = TextAlign.center,
    this.weight = FontWeight.w900,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          color: HexColor(textColor),
          fontSize: fontSize,
          fontWeight: weight,
        ),
      ),
    );
  }
}
