import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:munch_app/components/text_field_component.dart';
import '../components/raised_button_component.dart';
import '../components/text_component.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  bool group = false;
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              height: height,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  Row(
                    children: [
                      RaisedButtonCom(
                        title: "Login",
                        color: "FFFFFF",
                        fontSize: 18,
                        padding: 14,
                        radius: 10,
                        textColor: "000000",
                        borderColor: "000000",
                        borderWidth: 2,
                        provider: null,
                        route: null,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      RaisedButtonCom(
                        title: "Register",
                        color: "66CDAA",
                        fontSize: 18,
                        padding: 14,
                        radius: 10,
                        textColor: "FFFFFF",
                        borderColor: "66CDAA",
                        borderWidth: 2,
                        provider: null,
                        route: null,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFieldComponent(
                    borderRadius: 25,
                    label: "Mobile",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldComponent(
                    borderRadius: 25,
                    label: "Email",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldComponent(
                    borderRadius: 25,
                    label: "Password",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldComponent(
                    borderRadius: 25,
                    label: "Repeat Password",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          icon: SvgPicture.asset("lib/assets/Icon_FB.svg"),
                          onPressed: null),
                      IconButton(
                          icon: SvgPicture.asset("lib/assets/Icon_TW.svg"),
                          onPressed: null),
                      IconButton(
                          icon: SvgPicture.asset("lib/assets/Icon_IG.svg"),
                          onPressed: null),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.1,
                      ),
                      RaisedButtonCom(
                        title: "Register",
                        color: "F26882",
                        fontSize: 18,
                        padding: 20,
                        radius: 30,
                        textColor: "FFFFFF",
                        borderColor: "F26882",
                        borderWidth: 2,
                        provider: null,
                        route: null,
                      ),
                      SizedBox(
                        width: width * 0.1,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
