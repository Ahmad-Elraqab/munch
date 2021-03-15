import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    Key key,
    @required this.opacity,
  }) : super(key: key);

  final int opacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.grey,
          thickness: 0,
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextComponent(
                title: "Thank you, Munch!",
                fontSize: 14,
                textColor: "000000",
                weight: FontWeight.w700,
              ),
              SizedBox(
                height: 20,
              ),
              TextComponent(
                  title:
                      "This is your order from Munch bakery, you can get your order from\n Alhamra branch Arafat street, on 24/04/2021",
                  fontSize: 14,
                  textColor: "000000",
                  weight: FontWeight.w600),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 0, color: Colors.grey),
            ),
          ),
          child: ListTile(
            leading: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextComponent(
                    fontSize: 14,
                    textColor: "000000",
                    title: "24/04/2021",
                    weight: FontWeight.w700,
                  ),
                  GestureDetector(
                    onTap: () => null,
                    child: RaisedButtonCom(
                      title: "View ordered items",
                      color: "000FFFF",
                      fontSize: 14,
                      padding: 0,
                      radius: 0,
                      textAlign: null,
                      textColor: "F26882",
                      borderColor: "000FFFF",
                      borderWidth: 0,
                      fontWieght: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            trailing: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextComponent(
                    fontSize: 14,
                    textColor: "000000",
                    title: "Order(#0)",
                    weight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
