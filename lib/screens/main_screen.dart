import 'package:flutter/material.dart';
import 'package:munch_app/components/app.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/components/list_view_component.dart';
import 'package:munch_app/constants/routes.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  Color pink = HexColor("F26882");
  int hold = 0;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 300,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      getTranslated(context, "orderNowHeader"),
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      App(currentIndex: "/map-location"),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                              )
                            },
                            child: RaisedButtonCom(
                              title: getTranslated(context, "locateMe"),
                              color: "FFFFFF",
                              fontSize: 14,
                              padding: 10,
                              radius: 10,
                              textColor: "000000",
                              borderColor: "000000",
                              borderWidth: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Center(
                        child: TextComponent(
                          fontSize: 14,
                          title: getTranslated(context, "orButton").toString(),
                          textColor: "000000",
                        ),
                      ),
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              hold = 0;
                              buildShowDialog(context);
                              buildShowDialog(context);
                            },
                            child: RaisedButtonCom(
                              title: getTranslated(context, "chooseCity"),
                              color: "FFFFFF",
                              fontSize: 14,
                              padding: 10,
                              radius: 25,
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
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
                child: Row(
                  children: [
                    Text(
                      getTranslated(context, "mainPageRecommendedProducts"),
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListViewComponent(),
            ],
          ),
        ),
      ),
    );
  }

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.black),
              ),
            ),
            child: TextComponent(
              fontSize: 14,
              textColor: "000000",
              title: getTranslated(context, "chooseCity"),
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      hold++;
                      hold == 2
                          ? Navigator.popAndPushNamed(context, mMainScreenWhen)
                          : Navigator.pop(context);
                    },
                    child: RaisedButtonCom(
                      borderColor: "00FFFFFF",
                      color: "00FFFFFF",
                      fontSize: 14,
                      borderWidth: 0,
                      radius: 0,
                      padding: 16,
                      textColor: "000000",
                      title: "Makkah",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Divider(
                      thickness: 1,
                      height: 2,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: HexColor("FFFFFF"),
          actions: [],
        );
      },
    );
  }
}
