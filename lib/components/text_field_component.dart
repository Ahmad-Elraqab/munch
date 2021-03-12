import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TextFieldComponent extends StatelessWidget {
  String label;
  double borderRadius;
  Provider provider;
  int lines;

  TextFieldComponent({
    this.borderRadius,
    this.label,
    this.provider,
    this.lines = 1,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      decoration: new InputDecoration(
        focusColor: Colors.black,
        labelText: label,
        fillColor: Colors.black,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(borderRadius),
          borderSide: new BorderSide(color: Colors.black, width: 2),
        ),
        //fillColor: Colors.green
      ),
      // validator: (val) {
      //   if (val.length == 0) {
      //     return "Email cannot be empty";
      //   } else {
      //     return null;
      //   }
      // },
      // keyboardType: TextInputType.emailAddress,
      // style: new TextStyle(
      //   fontFamily: "Poppins",
      // ),
    );
  }
}
