import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';

class DirectHorizentalListView extends StatelessWidget {
  const DirectHorizentalListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: MediaQuery.of(context).size.width / 2.0,
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    child: Image(
                      image: NetworkImage(
                          'https://liveapi.munchbakery.com/munchimages/0353178_mini-cupcakes.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  TextComponent(
                    fontSize: 14,
                    textColor: "000000",
                    title: "Carrot Cake",
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextComponent(
                    fontSize: 14,
                    textColor: "F26882",
                    title: "10.50 SAR",
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {},
                          child: RaisedButtonCom(
                            title: getTranslated(context, "addToCartButton"),
                            color: "FFFFFF",
                            fontSize: 14,
                            padding: 5,
                            radius: 10,
                            textAlign: null,
                            textColor: "000000",
                            borderColor: "000000",
                            borderWidth: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
