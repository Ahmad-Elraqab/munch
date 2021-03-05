import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/constants/constants.dart';

class ListViewComponent extends StatelessWidget {
  const ListViewComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
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
          SizedBox(
            height: 20,
          ),
          Container(
            height: 260,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 3,
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
                            image: NetworkImage(
                                'https://liveapi.munchbakery.com/munchimages/0353178_mini-cupcakes.png'),
                            fit: BoxFit.contain,
                          ),
                        ),

                        Text(
                          'Carrot Cake',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => {},
                                child: RaisedButtonCom(
                                  title: getTranslated(
                                      context, "mainPageByNowButton"),
                                  color: "FFFFFF",
                                  fontSize: 13,
                                  padding: 8,
                                  radius: 10,
                                  textColor: "000000",
                                  borderColor: "000000",
                                  borderWidth: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
