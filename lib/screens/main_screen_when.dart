import 'package:flutter/material.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/components/list_view_component.dart';
import 'package:munch_app/components/text_component.dart';

// ignore: must_be_immutable
class MainScreenWhen extends StatelessWidget {
  Color pink = HexColor("F26882");

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
                      height: 30,
                    ),
                    Text(
                      getTranslated(context, "whenButton"),
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () =>
                                {Navigator.pushNamed(context, mCategory)},
                            child: RaisedButtonCom(
                              title: getTranslated(context, "orderNowButton"),
                              color: "FFFFFF",
                              fontSize: 14,
                              textAlign: null,
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
                            onTap: () =>
                                {Navigator.pushNamed(context, mCategory)},
                            child: RaisedButtonCom(
                              title:
                                  getTranslated(context, "reservationButton"),
                              color: "FFFFFF",
                              fontSize: 14,
                              textAlign: null,
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
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 0,
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
}
