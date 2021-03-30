import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:munch_app/providers/cart_provider.dart';
import 'package:munch_app/providers/future_provider.dart';
import 'package:munch_app/providers/user_provider.dart';

class ItemScreen extends StatefulWidget {
  @override
  RrestaurantStatesList createState() => RrestaurantStatesList();
}

class RrestaurantStatesList extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.78,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        padding: EdgeInsets.all(0.0),
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
          10,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                child: Consumer(
                  builder: (context, watch, child) {
                    final data = watch(responseProvider);
                    // final dataImg = watch(
                    //   imageProvider(data.data.value[index].picture.picturePath),
                    // );
                    // print(data.data.value);
                    return data.map(
                      error: (_) => Text("Error"),
                      loading: (_) => CircularProgressIndicator(),
                      data: (value) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () =>
                                {Navigator.pushNamed(context, mItemViewScreen)},
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://static.wixstatic.com/media/a278f4_d207ce23d9d745f3b45a3ea78b14d060~mv2.png/v1/fill/w_232,h_232,usm_1.20_1.00_0.01/file.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: TextComponent(
                              fontSize: 14,
                              textColor: "000000",
                              title: value.value[index].catName,
                            ),
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () => buildShowDialog(context),
                            child: RaisedButtonCom(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: 35,
                              borderColor: "000000",
                              color: "FFFFFF",
                              fontSize: 14,
                              borderWidth: 2,
                              padding: 2,
                              radius: 12,
                              textAlign: null,
                              textColor: "000000",
                              title: getTranslated(context, "addToCartButton"),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
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
                        child: Consumer(
                          builder: (context, watch, child) {
                            final data = watch(cartProvider);
                            return ListWheelScrollView.useDelegate(
                              itemExtent: 50,
                              diameterRatio: 1.5,
                              useMagnifier: true,
                              magnification: 1.5,
                              overAndUnderCenterOpacity: 0.5,
                              onSelectedItemChanged: (index) {
                                setState(
                                  () {
                                    data.itemsCount = index;
                                    print(data.itemsCount);
                                  },
                                );
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                builder: (BuildContext context, int index) {
                                  if (index < 1 || index > 10) {
                                    return null;
                                  } else
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
                            );
                          },
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
                Consumer(
                  builder: (context, watch, child) {
                    final data = watch(cartProvider);
                    return GestureDetector(
                      onTap: () => {},
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
                    );
                  },
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
