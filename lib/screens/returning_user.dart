import 'package:flutter/material.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/providers/ui_provider.dart';
import 'package:provider/provider.dart';
import 'package:munch_app/components/list_view_component.dart';

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
                      textStyle:
                          TextStyle(color: Colors.white, fontSize: 11.5),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButtonCom(
                        title: provider.title,
                        color: "F26882",
                        fontSize: 12,
                        padding: 8,
                        radius: 10,
                        textColor: "FFFFFF",
                        borderColor: "FFFFFF",
                        borderWidth: 2,
                        provider: provider,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButtonCom(
                        title: "Work",
                        color: "F26882",
                        fontSize: 12,
                        padding: 8,
                        radius: 10,
                        textColor: "FFFFFF",
                        borderColor: "FFFFFF",
                        borderWidth: 2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButtonCom(
                        title: "Home",
                        color: "F26882",
                        fontSize: 12,
                        padding: 8,
                        radius: 10,
                        textColor: "FFFFFF",
                        borderColor: "FFFFFF",
                        borderWidth: 2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      RaisedButtonCom(
                        title: "Add new location",
                        color: "F26882",
                        fontSize: 12,
                        padding: 8,
                        radius: 10,
                        textColor: "FFFFFF",
                        borderColor: "FFFFFF",
                        borderWidth: 2,
                        route: "/main-screen",
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
