import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/components/vertical_list_view_component.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: TextComponent(
                    fontSize: 16,
                    textColor: "000000",
                    title: "Cart",
                    weight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: TextComponent(
                    fontSize: 16,
                    textColor: "000000",
                    title: "Price",
                    weight: FontWeight.w700,
                  ),
                ),
                Expanded(
                  child: TextComponent(
                    fontSize: 16,
                    textColor: "000000",
                    title: "Quantity",
                    weight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
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
                    leading: CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: Colors.transparent,
                      child: Image(
                        image: NetworkImage(
                            "https://hsaa.hsobjects.com/h/menuitems/images/001/765/500/7dc3fb6c364fa160d3d32ec89194266b-size900.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: TextComponent(
                      fontSize: 16,
                      textColor: "000000",
                      title: "Red vlet cake",
                      weight: FontWeight.w600,
                      align: TextAlign.start,
                    ),
                    trailing: Container(
                      width: 110,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              onPressed: null),
                          TextComponent(
                            fontSize: 16,
                            textColor: "000000",
                            title: "1",
                            weight: FontWeight.w700,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              onPressed: null),
                        ],
                      ),
                    ),
                    subtitle: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RaisedButtonCom(
                            borderColor: "FFFFFF",
                            color: "FFFFFF",
                            borderWidth: 0,
                            height: 20,
                            fontSize: 14,
                            padding: 0,
                            radius: 0,
                            textColor: "F26882",
                            title: "delete",
                          ),
                          TextComponent(
                            title: "290 (SAR)",
                            fontSize: 14,
                            textColor: "F26882",
                            weight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
            child: TextComponent(
              fontSize: 16,
              textColor: "000000",
              title: "You might like this",
              weight: FontWeight.w700,
              align: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: VerticalListView(),
          ),
        ],
      ),
    );
  }
}
