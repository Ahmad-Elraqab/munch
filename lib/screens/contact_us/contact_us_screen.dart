import 'package:flutter/cupertino.dart';
import 'package:munch_app/components/raised_button_component.dart';
import 'package:munch_app/components/text_component.dart';
import 'package:munch_app/components/text_field_component.dart';
import 'package:munch_app/screens/contact_us/contact_us_viewmodel.dart';
import 'package:munch_app/screens/view.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: ContactUsViewmodel(),
      builder: (_, viewmodel, __) => Container(
        padding: EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            TextComponent(
              fontSize: 14,
              textColor: "000000",
              title: "Contact Us",
              weight: FontWeight.w700,
              align: TextAlign.start,
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldComponent(
              borderRadius: 10,
              label: "Name",
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldComponent(
              borderRadius: 25,
              label: "Email Address",
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldComponent(
              borderRadius: 25,
              label: "Phone Number",
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldComponent(
              borderRadius: 10,
              lines: 5,
              label: "Message",
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => null,
              child: RaisedButtonCom(
                width: MediaQuery.of(context).size.width * 0.35,
                height: 55,
                borderColor: "F26882",
                color: "F26882",
                fontSize: 14,
                borderWidth: 2,
                textAlign: null,
                padding: 10,
                radius: 12,
                textColor: "FFFFFF",
                title: "Send",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => null,
              child: RaisedButtonCom(
                width: MediaQuery.of(context).size.width * 0.35,
                height: 55,
                borderColor: "F26882",
                color: "F26882",
                fontSize: 14,
                borderWidth: 2,
                textAlign: null,
                padding: 10,
                radius: 12,
                textColor: "FFFFFF",
                title: "Contact us through whats app",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => null,
              child: RaisedButtonCom(
                width: MediaQuery.of(context).size.width * 0.35,
                height: 55,
                borderColor: "F26882",
                color: "F26882",
                fontSize: 14,
                textAlign: null,
                borderWidth: 2,
                padding: 10,
                radius: 12,
                textColor: "FFFFFF",
                title: "Direct message Munch support",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
