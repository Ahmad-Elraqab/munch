import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:munch_app/components/app.dart';
import 'package:munch_app/components/text_field_component.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:munch_app/screens/registeration_screen.dart';
import '../components/raised_button_component.dart';
import '../components/text_component.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  bool group = false;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {},
                          child: RaisedButtonCom(
                            title: "Login",
                            color: "66CDAA",
                            fontSize: 18,
                            padding: 14,
                            radius: 10,
                            textColor: "FFFFFF",
                            borderColor: "66CDAA",
                            borderWidth: 2,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => SignUp(),
                                transitionDuration: Duration(seconds: 0),
                              ),
                            )
                          },
                          child: RaisedButtonCom(
                            title: "Register",
                            color: "FFFFFF",
                            fontSize: 18,
                            padding: 14,
                            radius: 10,
                            textColor: "000000",
                            borderColor: "000000",
                            borderWidth: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextComponent(
                    fontSize: 40,
                    title: "Welcome back!",
                    textColor: "000000",
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextFieldComponent(
                    borderRadius: 25,
                    label: "Email or mobile",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldComponent(
                    borderRadius: 25,
                    label: "Password",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Radio(
                        splashRadius: 20,
                        toggleable: true,
                        value: true,
                        groupValue: widget.group,
                        onChanged: (t) {
                          setState(() {
                            widget.group = t;
                            print(t);
                          });
                        },
                      ),
                      TextComponent(
                        fontSize: 16,
                        textColor: "000000",
                        title: "Remember me?",
                      ),
                    ],
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
                      Expanded(
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.pushReplacementNamed(context, mUserReturn)
                          },
                          child: RaisedButtonCom(
                            title: "Login",
                            color: "F26882",
                            fontSize: 18,
                            padding: 20,
                            radius: 30,
                            textColor: "FFFFFF",
                            borderColor: "F26882",
                            borderWidth: 2,
                          ),
                        ),
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
