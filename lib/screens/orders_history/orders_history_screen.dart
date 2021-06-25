import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * 0.9,
          // color: Colors.amberAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              TextComponent(
                title: "Previous Orders",
                fontSize: 14,
                align: TextAlign.center,
                textColor: "000000",
                weight: FontWeight.w700,
              ),
              SizedBox(),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 1,
          height: 1,
        ),
        Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          height: MediaQuery.of(context).size.height * 0.65,
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: ListTile(
                  leading: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            textColor: "F26882",
                            borderColor: "000FFFF",
                            borderWidth: 0,
                            fontWieght: FontWeight.w700,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextComponent(
                          fontSize: 14,
                          textColor: "000000",
                          title: "Order(#0)",
                          weight: FontWeight.w700,
                        ),
                        TextComponent(
                          fontSize: 14,
                          textColor: "000000",
                          title: "Canceled",
                          weight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
