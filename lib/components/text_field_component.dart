import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TextFieldComponent extends StatelessWidget {
  String label;
  double borderRadius;
  Provider provider;
  int lines;
  double fontSize;
  TextEditingController myController;

  TextFieldComponent({
    this.borderRadius,
    this.label,
    this.provider,
    this.lines = 1,
    this.fontSize = 16,
    this.myController,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      decoration: new InputDecoration(
        disabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(borderRadius),
          borderSide: new BorderSide(color: Colors.black, width: 2),
        ),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(borderRadius),
          borderSide: new BorderSide(color: Colors.black, width: 2),
        ),
        focusColor: Colors.black,
        labelText: label,
        labelStyle: TextStyle(fontSize: fontSize),
        fillColor: Colors.black,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(borderRadius),
          borderSide: new BorderSide(color: Colors.black, width: 2),
        ),
        //fillColor: Colors.green
      ),
      controller: myController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'required';
        } else
          return null;
      },
    );
  }
}
