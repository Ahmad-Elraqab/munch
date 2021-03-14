import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';

class OrderItemsView extends StatelessWidget {
  const OrderItemsView({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.48,
      child: ListView.builder(
        padding: EdgeInsets.all(0.0),
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: HexColor("F26882").withOpacity(0.3),
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: ListTile(
              title: TextComponent(
                fontSize: 14,
                textColor: "000000",
                title: "Red vlet cake",
                weight: FontWeight.w600,
                align: TextAlign.start,
              ),
              trailing: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: TextComponent(
                    fontSize: 16,
                    textColor: "000000",
                    title: "1",
                    weight: FontWeight.w700,
                  ),
                ),
              ),
              subtitle: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => null,
                          child: RaisedButtonCom(
                            borderColor: "00FFFFF",
                            color: "00FFFFF",
                            borderWidth: 0,
                            height: 20,
                            fontSize: 14,
                            padding: 0,
                            radius: 0,
                            textColor: "F26882",
                            title: "delete",
                          ),
                        ),
                        TextComponent(
                          title: "290 (SAR)",
                          fontSize: 14,
                          textColor: "F26882",
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextComponent(
                      fontSize: 16,
                      textColor: "F26882",
                      title:
                          "Item is not available in this branch, delete or choose another branch",
                      weight: FontWeight.w600,
                      align: TextAlign.start,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
