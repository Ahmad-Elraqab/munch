import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/screens/profile/profile_viewmodel.dart';
import 'package:munch_app/screens/view.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool active = true;
  String title = "Arabic";
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: ProfileViewmodel(),
      builder: (_, viewmodel, __) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              height: 150,
              child: SvgPicture.asset(
                "lib/assets/HappyCupcake.svg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextComponent(
              fontSize: 14,
              textColor: "000000",
              title: "Welcome",
              weight: FontWeight.w700,
            ),
            SizedBox(
              height: 10,
            ),
            TextComponent(
              fontSize: 20,
              textColor: "000000",
              title: "Munch",
              weight: FontWeight.w700,
            ),
            SizedBox(
              height: 10,
            ),
            TextComponent(
              fontSize: 14,
              textColor: "000000",
              title: "0569742447",
              weight: FontWeight.w700,
            ),
            SizedBox(
              height: 10,
            ),
            TextComponent(
              fontSize: 14,
              textColor: "000000",
              title: "0569742447@munchwebsite.com",
              weight: FontWeight.w700,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      active = true;
                      setState(() {});
                    },
                    child: RaisedButtonCom(
                      title: "Edit Profile",
                      color: "F26882",
                      fontSize: 14,
                      padding: 12,
                      radius: 10,
                      textColor: "FFFFFF",
                      textAlign: null,
                      borderColor: "F26882",
                      borderWidth: 2,
                      fontWieght: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      title = "English";
                      setState(() {});
                    },
                    child: RaisedButtonCom(
                      title: title,
                      color: "FFFFFF",
                      fontSize: 14,
                      padding: 14,
                      radius: 10,
                      textColor: "000000",
                      borderColor: "000000",
                      textAlign: null,
                      borderWidth: 2,
                      fontWieght: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: RaisedButtonCom(
                title: "Change password",
                color: "FFFFFF",
                fontSize: 14,
                padding: 14,
                radius: 10,
                textColor: "000000",
                borderColor: "000000",
                width: 200,
                textAlign: null,
                borderWidth: 2,
                fontWieght: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
