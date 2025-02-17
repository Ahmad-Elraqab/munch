import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/constants/routes.dart';

class ListViewComponent extends StatefulWidget {
  const ListViewComponent({
    Key key,
  }) : super(key: key);

  @override
  _ListViewComponentState createState() => _ListViewComponentState();
}

class _ListViewComponentState extends State<ListViewComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Container(
        height: 260,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: MediaQuery.of(context).size.width / 2.5,
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   'lib/assets/main_logo.svg',
                  // ),
                  Container(
                    color: Colors.white,
                    child: Image(
                      image: NetworkImage(""),
                      fit: BoxFit.contain,
                    ),
                  ),

                  Text(
                    "Mucnh",
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
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
                          onTap: () =>
                              {Navigator.pushNamed(context, mItemScreen)},
                          child: RaisedButtonCom(
                            title:
                                getTranslated(context, "mainPageByNowButton"),
                            color: "FFFFFF",
                            fontSize: 14,
                            padding: 8,
                            radius: 10,
                            textAlign: null,
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
          },
        ),
      ),
    );
  }
}
