import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/components/order_status_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/constants/routes.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool active = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          // color: Colors.amber,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextComponent(
                        textColor: "000000",
                        fontSize: 70,
                        title: "YAY!",
                        weight: FontWeight.bold,
                      ),
                      TextComponent(
                        fontSize: 16,
                        textColor: "000000",
                        title: "Everything is good,\n order received",
                        weight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  height: 200,
                  child: SvgPicture.asset(
                    "lib/assets/HappyCupcake.svg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, mOrdersHistory),
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Colors.grey),
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: Center(
              child: TextComponent(
                fontSize: 18,
                textColor: "F26882",
                title: "view orders history",
                weight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Center(
            child: TextComponent(
              fontSize: 18,
              textColor: "000000",
              title: "last order (#0)",
              weight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(15),
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    active = true;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color:
                            active == true ? HexColor("F26882") : Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextComponent(
                        fontSize: 16,
                        textColor: active == true ? "FFFFFF" : "000000",
                        title: "order status",
                        weight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    active = false;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color:
                            active == false ? HexColor("F26882") : Colors.white,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Center(
                      child: TextComponent(
                        fontSize: 16,
                        textColor: active == false ? "FFFFFF" : "000000",
                        title: "order summary",
                        weight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        OrderStatus(),
      ],
    );
  }
}
