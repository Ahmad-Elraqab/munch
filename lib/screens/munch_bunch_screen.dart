import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';

class MunchBunch extends StatefulWidget {
  @override
  _MunchBunchState createState() => _MunchBunchState();
}

class _MunchBunchState extends State<MunchBunch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextComponent(
            fontSize: 20,
            textColor: "000000",
            title: "Munch",
            weight: FontWeight.w700,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextComponent(
                fontSize: 14,
                textColor: "F26882",
                title: "Platinum VIP ",
                weight: FontWeight.w700,
              ),
              TextComponent(
                fontSize: 14,
                textColor: "000000",
                title: "Membership",
                weight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextComponent(
            fontSize: 14,
            textColor: "000000",
            title: "68392 Points",
            weight: FontWeight.w700,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: HexColor("F26882"),
                height: 30,
                width: MediaQuery.of(context).size.width * 0.60,
                child: Center(
                  child: TextComponent(
                    align: TextAlign.start,
                    fontSize: 14,
                    weight: FontWeight.w600,
                    textColor: "FFFFFF",
                    title: "0 of 60000",
                  ),
                ),
              ),
              TextComponent(
                fontSize: 14,
                textColor: "000000",
                title: "Next Level",
                weight: FontWeight.w600,
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButtonCom(
            title: "View Operations",
            color: "FFFFFF",
            width: 250,
            fontSize: 14,
            padding: 10,
            radius: 15,
            textColor: "000000",
            borderColor: "000000",
            borderWidth: 2,
            fontWieght: FontWeight.w700,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey),
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextComponent(
                  fontSize: 14,
                  textColor: "000000",
                  title: "Points can be redeem",
                  weight: FontWeight.w700,
                ),
                TextComponent(
                  fontSize: 20,
                  textColor: "000000",
                  title: "43180 Points",
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextComponent(
            fontSize: 14,
            textColor: "000000",
            title: "Replace in store",
            weight: FontWeight.w600,
          ),

          TextComponent(
            fontSize: 14,
            textColor: "000000",
            title: "Password 9844",
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
