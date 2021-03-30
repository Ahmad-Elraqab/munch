import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:munch_app/components/text_field_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/constants/routes.dart';
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
    var height = MediaQuery.of(context).size.height * 0.5;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(16),
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextComponent(
            fontSize: 20,
            title: getTranslated(context, "welcomeBack"),
            textColor: "000000",
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: 40,
            child: TextFieldComponent(
              borderRadius: 20,
              fontSize: 12,
              label: getTranslated(context, "loginInputFieldEmailPlaceholder"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            child: TextFieldComponent(
              borderRadius: 20,
              fontSize: 12,
              label:
                  getTranslated(context, "loginInputFieldPasswordPlaceholder"),
            ),
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
                fontSize: 14,
                textColor: "000000",
                title: getTranslated(context, "loginRememberMe"),
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
                  onTap: () =>
                      {Navigator.pushReplacementNamed(context, mUserReturn)},
                  child: RaisedButtonCom(
                    title: getTranslated(context, "login"),
                    color: "F26882",
                    textAlign: null,
                    fontSize: 12,
                    padding: 12,
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
    );
  }
}
