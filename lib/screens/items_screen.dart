import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/constants/routes.dart';

class ItemScreen extends StatefulWidget {
  @override
  RrestaurantStatesList createState() => RrestaurantStatesList();
}

class RrestaurantStatesList extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        children: List.generate(
          10,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://liveapi.munchbakery.com/munchimages/0353178_mini-cupcakes.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: TextComponent(
                        fontSize: 16,
                        textColor: "000000",
                        title: "Seasonal Cake",
                      ),
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () =>
                          {Navigator.pushNamed(context, mItemViewScreen)},
                      child: RaisedButtonCom(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: 35,
                        borderColor: "000000",
                        color: "FFFFFF",
                        fontSize: 14,
                        borderWidth: 2,
                        padding: 2,
                        radius: 12,
                        textColor: "000000",
                        title: getTranslated(context, "addToCartButton"),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
