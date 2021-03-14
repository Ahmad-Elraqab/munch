import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRow("F26882", "Received"),
          buildPadding(),
          buildRow("FFFFFF", "Preparing"),
          buildPadding(),
          buildRow("FFFFFF", "Ready"),
        ],
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, right: 13),
      child: Container(
        height: 30,
        width: 2,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
      ),
    );
  }

  Row buildRow(String color, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: HexColor(color),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        TextComponent(
          fontSize: 14,
          textColor: "000000",
          title: title,
          weight: FontWeight.w700,
        )
      ],
    );
  }
}
