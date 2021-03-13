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
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Column(
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
                    fontSize: 18,
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
                        fontSize: 16,
                        textColor: "000000",
                        title: "24/04/2021",
                        weight: FontWeight.w700,
                      ),
                      GestureDetector(
                        onTap: () => null,
                        child: RaisedButtonCom(
                          title: "View ordered items",
                          color: "000FFFF",
                          fontSize: 16,
                          padding: 0,
                          radius: 0,
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
                        fontSize: 16,
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
        ),
        Center(
          child: GestureDetector(
            // onDoubleTap: () {
            //   opacity = 0;
            //   setState(() {});
            // },
            // onTap: () {
            //   opacity = 1;
            //   setState(() {});
            // },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                elevation: 10,
                color: Colors.white.withOpacity(opacity.toDouble()),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  color: Colors.white.withOpacity(opacity.toDouble()),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            fontSize: 16,
                            textColor: "000000",
                            title: "Items total",
                            weight: FontWeight.w700,
                          ),
                          TextComponent(
                            fontSize: 16,
                            textColor: "000000",
                            title: "759.00 SAR",
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            fontSize: 16,
                            textColor: "000000",
                            title: "Discount",
                            weight: FontWeight.w700,
                          ),
                          TextComponent(
                            fontSize: 16,
                            textColor: "000000",
                            title: "0 SAR",
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            fontSize: 16,
                            textColor: "000000",
                            title: "Delivery",
                            weight: FontWeight.w700,
                          ),
                          TextComponent(
                            fontSize: 16,
                            textColor: "000000",
                            title: "Free",
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            fontSize: 16,
                            textColor: "000000",
                            title: "Total",
                            weight: FontWeight.w700,
                          ),
                          TextComponent(
                            fontSize: 16,
                            textColor: "F26882",
                            title: "759 SAR",
                            weight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
