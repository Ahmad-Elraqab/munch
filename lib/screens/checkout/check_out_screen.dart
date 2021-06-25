import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/order_details_component.dart';
import 'package:munch_app/components/order_items_view.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';

// ignore: must_be_immutable
class Checkout extends StatefulWidget {
  bool group = false;
  @override
  CheckoutState createState() => CheckoutState();
}

class CheckoutState extends State<Checkout> {
  bool active = true;
  String title = "View all 5 items";
  bool activePage = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.78,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0),
                  ),
                ),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextComponent(
                      fontSize: 14,
                      textColor: "000000",
                      title: "Order Details",
                      weight: FontWeight.w700,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (activePage == true) {
                          activePage = false;
                          title = "Close this";
                        } else {
                          activePage = true;
                          title = "View all 5 items";
                        }
                        setState(() {});
                      },
                      child: TextComponent(
                        fontSize: 14,
                        textColor: "F26882",
                        title: title,
                        weight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              activePage == true
                  ? OrderDetailsComponent()
                  : OrderItemsView(context: context),
            ],
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 150,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextComponent(
                      textColor: "000000",
                      fontSize: 14,
                      title: "Payment details",
                      weight: FontWeight.w700,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.arrow_downward,
                          color: HexColor("F26882"),
                        ),
                        onPressed: null),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () => null,
                    child: RaisedButtonCom(
                      borderColor: "F26882",
                      color: "F26882",
                      fontSize: 14,
                      textAlign: null,
                      borderWidth: 0,
                      radius: 7,
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: 14,
                      textColor: "FFFFFF",
                      title: "Procced to checkout",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
