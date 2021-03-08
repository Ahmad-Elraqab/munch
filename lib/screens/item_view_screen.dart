import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/components/list_view_component.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/constants/routes.dart';

class ItemViewScreen extends StatefulWidget {
  @override
  _ItemViewScreenState createState() => _ItemViewScreenState();
}

class _ItemViewScreenState extends State<ItemViewScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.all(50.0),
                    child: Center(
                      child: Image(
                        image: NetworkImage(
                            "https://hsaa.hsobjects.com/h/menuitems/images/001/765/500/7dc3fb6c364fa160d3d32ec89194266b-size900.png"),
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextComponent(
                          fontSize: 18,
                          textColor: "000000",
                          title: "Red velvet",
                          weight: FontWeight.w700,
                        ),
                        GestureDetector(
                          onTap: () => {buildShowDialog(context)},
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextComponent(
                          fontSize: 16,
                          textColor: "F26882",
                          title: "209 (SAR)",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextComponent(
                      fontSize: 13,
                      textColor: "000000",
                      weight: FontWeight.normal,
                      align: TextAlign.start,
                      title:
                          "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu odio ut sem nulla pharetra diam sit. Lorem ipsum dolor sit",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          thickness: 1,
          height: 20,
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: HexColor("F26882"),
              height: 30,
              width: MediaQuery.of(context).size.width * 0.40,
              child: Center(
                child: TextComponent(
                  align: TextAlign.center,
                  fontSize: 15,
                  textColor: "FFFFFF",
                  title: "Related items",
                ),
              ),
            ),
          ],
        ),
        Container(
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
                        fontSize: 16,
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
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {},
                              child: RaisedButtonCom(
                                title:
                                    getTranslated(context, "addToCartButton"),
                                color: "FFFFFF",
                                fontSize: 14,
                                padding: 5,
                                radius: 10,
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
        ),
      ],
    );
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextComponent(
            fontSize: 16,
            weight: FontWeight.w700,
            textColor: "000000",
            title: getTranslated(context, "HowMany"),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            height: 3,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.grey)),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.1,
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 50,
                          diameterRatio: 1.5,
                          useMagnifier: true,
                          magnification: 1.5,
                          overAndUnderCenterOpacity: 0.5,
                          childDelegate: ListWheelChildBuilderDelegate(
                            builder: (BuildContext context, int index) {
                              if (index < 0 || index > 10) {
                                return null;
                              } else {
                                print(index);
                              }
                              return Text(
                                index.toString(),
                                style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                    color: HexColor("F26882"),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            height: 3,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.grey)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => {Navigator.pop(context)},
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
          backgroundColor: HexColor("FFFFFF"),
          actions: [],
        );
      },
    );
  }
}