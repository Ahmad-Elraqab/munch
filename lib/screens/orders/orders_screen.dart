import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:munch_app/components/order_summary.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/components/order_status_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:munch_app/screens/orders/orders_viewmodel.dart';
import 'package:munch_app/screens/view.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool active = true;
  int opacity = 1;
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: OrdersViewmodel(),
      builder: (_, viewmodel, __) => Container(
        height: MediaQuery.of(context).size.height * 0.78,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                                fontSize: 14,
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
                        top: BorderSide(width: 0, color: Colors.grey),
                        bottom: BorderSide(width: 0, color: Colors.grey),
                      ),
                    ),
                    child: Center(
                      child: TextComponent(
                        fontSize: 14,
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
                      fontSize: 14,
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
                                color: active == true
                                    ? HexColor("F26882")
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: TextComponent(
                                fontSize: 14,
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
                                color: active == false
                                    ? HexColor("F26882")
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Center(
                              child: TextComponent(
                                fontSize: 14,
                                textColor:
                                    active == false ? "FFFFFF" : "000000",
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
                active == true ? OrderStatus() : OrderSummary(opacity: opacity),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
          floatingActionButton: active == false
              ? Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    height: 150,
                    child: Card(
                      elevation: 10,
                      color: Colors.white.withOpacity(opacity.toDouble()),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextComponent(
                                  fontSize: 14,
                                  textColor: "000000",
                                  title: "Items total",
                                  weight: FontWeight.w700,
                                ),
                                TextComponent(
                                  fontSize: 14,
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
                                  fontSize: 14,
                                  textColor: "000000",
                                  title: "Discount",
                                  weight: FontWeight.w700,
                                ),
                                TextComponent(
                                  fontSize: 14,
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
                                  fontSize: 14,
                                  textColor: "000000",
                                  title: "Delivery",
                                  weight: FontWeight.w700,
                                ),
                                TextComponent(
                                  fontSize: 14,
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
                                  fontSize: 14,
                                  textColor: "000000",
                                  title: "Total",
                                  weight: FontWeight.w700,
                                ),
                                TextComponent(
                                  fontSize: 14,
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
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
