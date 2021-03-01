import 'package:flutter/material.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/providers/ui_provider.dart';
import 'package:provider/provider.dart';
import 'package:munch_app/components/list_view_component.dart';

class MainScreen extends StatelessWidget {
  Color pink = HexColor("F26882");

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UiProvider>(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SingleChildScrollView(
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
                      'Order now!',
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
                      'Feeling hungry? Want a quick birthday cake? \nEngagement surprise? jsut want to try something new?',
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
                      children: [
                        RaisedButtonCom(
                          title: "Locate me",
                          color: "F26882",
                          fontSize: 12,
                          padding: 8,
                          radius: 10,
                          textColor: "FFFFFF",
                          borderColor: "FFFFFF",
                          borderWidth: 2,
                          provider: null,
                          route: "/main-screen-when",
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Text("or"),
                      height: 5,
                    ),
                    Row(
                      children: [
                        RaisedButtonCom(
                          title: "Choose city",
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
