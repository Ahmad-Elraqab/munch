import 'package:flutter/material.dart';
import 'package:munch_app/components/app.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:munch_app/components/list_view_component.dart';

// ignore: must_be_immutable
class ReturningUser extends StatelessWidget {
  Color pink = HexColor("F26882");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    getTranslated(context, "welcomeBack"),
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    App(currentIndex: mMainScreenWhen),
                                transitionDuration: Duration(seconds: 0),
                              ),
                            )
                          },
                          child: RaisedButtonCom(
                            title: "Office",
                            color: "FFFFFF",
                            fontSize: 16,
                            padding: 10,
                            radius: 10,
                            textColor: "000000",
                            borderColor: "000000",
                            borderWidth: 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RaisedButtonCom(
                          title: "Work",
                          color: "FFFFFF",
                          fontSize: 16,
                          padding: 10,
                          radius: 10,
                          textColor: "000000",
                          borderColor: "000000",
                          borderWidth: 2,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RaisedButtonCom(
                          title: "Home",
                          color: "FFFFFF",
                          fontSize: 16,
                          padding: 10,
                          radius: 10,
                          textColor: "000000",
                          borderColor: "000000",
                          borderWidth: 2,
                        ),
                      ),
                    ],
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
                                    App(currentIndex: mMainScreen),
                                transitionDuration: Duration(seconds: 0),
                              ),
                            )
                          },
                          child: RaisedButtonCom(
                            title: getTranslated(
                                context, "mainPageAddNewAddressButton"),
                            color: "FFFFFF",
                            fontSize: 16,
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
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
              child: Row(
                children: [
                  Text(
                    getTranslated(context, "mainPageRecommendedProducts"),
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
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
    );
  }
}
