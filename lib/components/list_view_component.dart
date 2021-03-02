import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munch_app/components/raised_button_component.dart';

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
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            child: Row(
              children: [
                Text(
                  'Recomended for you',
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
            height: 280,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        // SvgPicture.asset(
                        //   'lib/assets/main_logo.svg',
                        // ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(80),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 9,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Image(
                            image: NetworkImage(
                                'https://liveapi.munchbakery.com/munchimages/0352900_red-velvet-cupcake.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                        Text(
                          '6.00 (SAR)',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.pink,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RaisedButtonCom(
                          title: "Buy Now",
                          color: "FFFFFF",
                          fontSize: 13,
                          padding: 8,
                          radius: 10,
                          textColor: "000000",
                          borderColor: "000000",
                          borderWidth: 3,
                          provider: null,
                          route: null,
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
