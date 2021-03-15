import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/components/text_field_component.dart';

class OrderDetailsComponent extends StatefulWidget {
  OrderDetailsComponent({
    Key key,
  }) : super(key: key);
  bool group = false;
  bool active;
  BuildContext context;
  int selectedIndex;

  @override
  _OrderDetailsComponentState createState() => _OrderDetailsComponentState();
}

class _OrderDetailsComponentState extends State<OrderDetailsComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                title: "Order Location",
                weight: FontWeight.w700,
              ),
              TextComponent(
                fontSize: 14,
                textColor: "000000",
                title: "Jeddah - Albsaten",
                weight: FontWeight.w700,
              ),
            ],
          ),
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
                title: "Payment Method",
                weight: FontWeight.w700,
              ),
              Row(
                children: [
                  TextComponent(
                    fontSize: 14,
                    textColor: "000000",
                    title: "on delivery",
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButtonCom(
                    borderColor: "00FFFFFF",
                    color: "00FFFFFF",
                    fontSize: 14,
                    borderWidth: 0,
                    textAlign: null,
                    radius: 0,
                    padding: 0,
                    textColor: "000000",
                    title: "Change",
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16.0),
          child: TextComponent(
            fontSize: 14,
            align: TextAlign.start,
            textColor: "000000",
            title: "How to do you want to recieve the order?",
            weight: FontWeight.w700,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.active = false;
                    setState(() {});
                  },
                  child: RaisedButtonCom(
                    title: "Delivery",
                    color: widget.active == true ? "FFFFFF" : "F26882",
                    fontSize: 14,
                    textAlign: null,
                    padding: 10,
                    radius: 10,
                    textColor: widget.active == true ? "000000" : "FFFFFF",
                    borderColor: widget.active == true ? "000000" : "F26882",
                    borderWidth: 2,
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.active = true;
                    setState(() {});
                  },
                  child: RaisedButtonCom(
                    title: "Pickup",
                    color: widget.active == true ? "F26882" : "FFFFFF",
                    fontSize: 14,
                    textAlign: null,
                    padding: 10,
                    radius: 10,
                    textColor: widget.active == true ? "FFFFFF" : "000000",
                    borderColor: widget.active == true ? "F26882" : "000000",
                    borderWidth: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
        widget.active == true ? delivery(context) : pickup(context),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextComponent(
                fontSize: 16,
                textColor: "000000",
                title: "Available time",
                weight: FontWeight.w700,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: TextFieldComponent(
                  label: "02/26/2021",
                  lines: 1,
                  borderRadius: 20,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          padding:
              EdgeInsets.only(left: 8.0, top: 16.0, bottom: 16.0, right: 8.0),
          // color: Colors.amberAccent,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            // padding: EdgeInsets.all(8.0),
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: GestureDetector(
                onTap: () {
                  widget.selectedIndex = index;
                  setState(() {});
                },
                child: RaisedButtonCom(
                  borderColor:
                      widget.selectedIndex == index ? "F26882" : "000000",
                  color: "00FFFFFF",
                  fontSize: 14,
                  borderWidth: 2,
                  radius: 20,
                  width: 100,
                  padding: 0.0,
                  textAlign: null,
                  textColor:
                      widget.selectedIndex == index ? "F26882" : "000000",
                  title: "10:00-12:00",
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey, width: 0),
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent(
                fontSize: 14,
                textColor: "000000",
                title: "Coupon?",
                weight: FontWeight.w700,
              ),
              Row(
                children: [
                  TextComponent(
                    fontSize: 14,
                    textColor: "000000",
                    title: "0% OFF",
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => null,
                    child: RaisedButtonCom(
                      borderColor: "00FFFFFF",
                      color: "00FFFFFF",
                      fontSize: 14,
                      borderWidth: 0,
                      textAlign: null,
                      radius: 0,
                      padding: 0,
                      textColor: "000000",
                      title: "Add",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey, width: 0),
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent(
                fontSize: 14,
                textColor: "000000",
                title: "Exchange points",
                weight: FontWeight.w700,
              ),
              Row(
                children: [
                  TextComponent(
                    fontSize: 14,
                    textColor: "000000",
                    title: "",
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => null,
                    child: RaisedButtonCom(
                      borderColor: "00FFFFFF",
                      color: "00FFFFFF",
                      fontSize: 14,
                      borderWidth: 0,
                      textAlign: null,
                      radius: 0,
                      padding: 0,
                      textColor: "000000",
                      title: "Add",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey, width: 0),
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent(
                fontSize: 14,
                textColor: "000000",
                title: "Print a photo on a the cake",
                weight: FontWeight.w700,
              ),
              Row(
                children: [
                  TextComponent(
                    fontSize: 14,
                    textColor: "000000",
                    title: "",
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => null,
                    child: RaisedButtonCom(
                      borderColor: "00FFFFFF",
                      color: "00FFFFFF",
                      fontSize: 14,
                      borderWidth: 0,
                      textAlign: null,
                      radius: 0,
                      padding: 0,
                      textColor: "000000",
                      title: "Add",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: TextFieldComponent(
            label: "Order Details",
            lines: 5,
            borderRadius: 20,
          ),
        ),
        SizedBox(
          height: 140,
        ),
      ],
    );
  }

  Column pickup(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          height: 56,
          child: TextFieldComponent(
            label: "Address description",
            lines: 1,
            borderRadius: 20,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                  height: 48,
                  child: TextFieldComponent(
                    label: "Address name",
                    lines: 1,
                    borderRadius: 20,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(
                      splashRadius: 20,
                      toggleable: true,
                      value: true,
                      groupValue: widget.group,
                      onChanged: (t) {
                        setState(() {
                          widget.group = t;
                          print(t);
                        });
                      },
                    ),
                    TextComponent(
                      fontSize: 16,
                      textColor: "000000",
                      title: "Save for later",
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column delivery(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Container(
            height: 100,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.all(0.0),
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Row(
                  children: [
                    TextComponent(
                      fontSize: 14,
                      textColor: "000000",
                      title: "Ahamra arafat street",
                      weight: FontWeight.w600,
                    ),
                    TextComponent(
                      fontSize: 12,
                      textColor: "F26882",
                      title: " (Not all items are available)",
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 4.0, right: 4.0),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Radio(
                splashRadius: 20,
                toggleable: true,
                value: true,
                groupValue: widget.group,
                onChanged: (t) {
                  setState(() {
                    widget.group = t;
                    print(t);
                  });
                },
              ),
              TextComponent(
                fontSize: 16,
                textColor: "000000",
                title: "Deliver to my car",
                weight: FontWeight.w600,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          height: 40,
          child: TextFieldComponent(
            label: "Car Description",
            lines: 1,
            borderRadius: 20,
          ),
        ),
      ],
    );
  }
}
