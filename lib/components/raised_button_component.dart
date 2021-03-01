import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/components/app.dart';

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
  String route;
  dynamic provider;

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
    this.provider,
    this.route,
  });

  @override
  _RaisedButtonComState createState() => _RaisedButtonComState();
}

class _RaisedButtonComState extends State<RaisedButtonCom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        onPressed: () => widget.provider == null
            ? Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => App(currentIndex: widget.route),
                  transitionDuration: Duration(seconds: 0),
                ))
            : widget.provider.onTap(),
        textColor: HexColor(widget.textColor),
        color: HexColor(widget.color),
        hoverColor: Colors.pink,
        splashColor: Colors.pink,
        padding: EdgeInsets.all(widget.padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
          side: BorderSide(
              color: HexColor(widget.borderColor), width: widget.borderWidth),
        ),
        child: Text(widget.title,
            style: TextStyle(
                fontSize: widget.fontSize, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
