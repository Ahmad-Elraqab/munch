import 'package:flutter/material.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';

// ignore: must_be_immutable
class RaisedButtonCom extends StatefulWidget {
  String title;
  double radius;
  double padding;
  double fontSize;
  String color;
  String textColor;
  String borderColor;
  double borderWidth;
  String fontWieght;

  RaisedButtonCom({
    this.title,
    this.radius,
    this.fontSize,
    this.padding,
    this.color,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.fontWieght,
  });

  @override
  _RaisedButtonComState createState() => _RaisedButtonComState();
}

class _RaisedButtonComState extends State<RaisedButtonCom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
        color: HexColor(widget.color),
        borderRadius: BorderRadius.circular(widget.radius),
        border: Border.all(
            color: HexColor(widget.borderColor), width: widget.borderWidth),
      ),
      child: TextComponent(
        fontSize: widget.fontSize,
        textColor: widget.textColor,
        title: widget.title,
      ),
    );
  }
}
