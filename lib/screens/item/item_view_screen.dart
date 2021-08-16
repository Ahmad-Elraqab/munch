import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/components/horizental_list_view_component.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/providers/product_provider/product_action.dart';

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
        Consumer(
          builder: (context, watch, child) {
            final data = watch(productDetaislProvider);
            return data.map(
              error: (_) => Text("Error"),
              loading: (_) => Center(child: CircularProgressIndicator()),
              data: (value) => Container(
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
                                data.data.value.lstPictures == null
                                    ? "https://static.wixstatic.com/media/a278f4_d207ce23d9d745f3b45a3ea78b14d060~mv2.png/v1/fill/w_232,h_232,usm_1.20_1.00_0.01/file.png"
                                    : data.data.value.lstPictures.picturePath
                                        .toString(),
                              ),
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
                                fontSize: 14,
                                textColor: "000000",
                                title: data.data.value.name.toString(),
                                weight: FontWeight.w700,
                              ),
                              GestureDetector(
                                onTap: () => {buildShowDialog(context)},
                                child: RaisedButtonCom(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height: 35,
                                  borderColor: "000000",
                                  textAlign: null,
                                  color: "FFFFFF",
                                  fontSize: 14,
                                  borderWidth: 2,
                                  padding: 2,
                                  radius: 12,
                                  textColor: "000000",
                                  title:
                                      getTranslated(context, "addToCartButton"),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextComponent(
                                fontSize: 14,
                                textColor: "F26882",
                                title:
                                    "${data.data.value.price.toString()} (SAR)",
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
                            title: data.data.value.description.toString(),
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
            );
          },
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
        DirectHorizentalListView(),
      ],
    );
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: TextComponent(
            fontSize: 14,
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
                    textAlign: null,
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
