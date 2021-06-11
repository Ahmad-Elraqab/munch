import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/screens/about_us/about_us_viewmodel.dart';
import 'package:munch_app/screens/view.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: AboutUseViewmodel(),
      builder: (_, viewmodel, __) => Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: NetworkImage(
                    "https://image.freepik.com/free-vector/cookies-pattern-background_9845-34.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextComponent(
                    fontSize: 20,
                    textColor: "000000",
                    title: "How everything started",
                    weight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextComponent(
                    align: TextAlign.start,
                    fontSize: 14,
                    textColor: "000000",
                    title:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic",
                    weight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            GestureDetector(
              onTap: () => null,
              child: RaisedButtonCom(
                borderColor: "000000",
                color: "00FFFFF",
                borderWidth: 2,
                textAlign: null,
                fontSize: 14,
                padding: 12,
                radius: 15,
                width: MediaQuery.of(context).size.width * 0.5,
                textColor: "000000",
                title: "Comapny rules",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
