import 'package:flutter/material.dart';
import 'package:munch_app/components/app.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:munch_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:munch_app/components/list_view_component.dart';

// ignore: must_be_immutable
class ReturningUser extends StatelessWidget {
  Color pink = HexColor("F26882");

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UiProvider>(context);
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: pink,
              height: 300,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Already back?',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'We knew that you gonna love Munch products, welcome again!\nPick your previously saved locations or add a new one.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(color: Colors.white, fontSize: 11.5),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                            title: provider.title,
                            color: "F26882",
                            fontSize: 14,
                            padding: 10,
                            radius: 10,
                            textColor: "FFFFFF",
                            borderColor: "FFFFFF",
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
                          color: "F26882",
                          fontSize: 14,
                          padding: 10,
                          radius: 10,
                          textColor: "FFFFFF",
                          borderColor: "FFFFFF",
                          borderWidth: 2,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RaisedButtonCom(
                          title: "Home",
                          color: "F26882",
                          fontSize: 14,
                          padding: 10,
                          radius: 10,
                          textColor: "FFFFFF",
                          borderColor: "FFFFFF",
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
                            title: "Add new location",
                            color: "F26882",
                            fontSize: 14,
                            padding: 10,
                            radius: 10,
                            textColor: "FFFFFF",
                            borderColor: "FFFFFF",
                            borderWidth: 2,
                          ),
                        ),
                      ),
                    ],
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
