import 'package:flutter/material.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/providers/ui_provider.dart';
import 'package:provider/provider.dart';
import 'package:munch_app/components/list_view_component.dart';

class MainScreenWhen extends StatelessWidget {
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
                      'When',
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
                      'When you want your order to be ready?',
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
                          title: "I want it now",
                          color: "F26882",
                          fontSize: 14,
                          padding: 8,
                          radius: 10,
                          textColor: "FFFFFF",
                          borderColor: "FFFFFF",
                          borderWidth: 2,
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
                          title: "I want reservation",
                          color: "F26882",
                          fontSize: 14,
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
