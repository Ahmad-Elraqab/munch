import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:munch_app/components/text_field_component.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/providers/user_provider/user_action.dart';
import '../../components/raised_button_component.dart';
import '../../components/text_component.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  bool group = false;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.55;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      height: height,
      // color: Colors.amber,
      child: Consumer(builder: (context, watch, child) {
        final data = watch(setLoading).isLoading;
        return data == true
            ? Container(
                height: 100,
                width: 100,
                child: Center(child: CircularProgressIndicator()))
            : Form(
                key: _formKey,
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
                        fontSize: 10,
                        myController: watch(setLoading).emailController,
                        label: getTranslated(
                            context, "loginInputFieldEmailPlaceholder"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 40,
                      child: TextFieldComponent(
                        borderRadius: 20,
                        fontSize: 10,
                        myController: watch(setLoading).passwordController,
                        label: getTranslated(
                            context, "loginInputFieldPasswordPlaceholder"),
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
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                            ),
                            onPressed: () {
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (!_formKey.currentState.validate()) {
                                // Process data.
                              } else {
                                watch(setLoading).setLoading();

                                watch(loginProvider(context));
                              }
                            },
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    watch(setLoading).isError == true
                        ? TextComponent(
                            fontSize: 12,
                            title: "username or password is incorrect",
                            textColor: "F26882",
                            weight: FontWeight.w700,
                          )
                        : SizedBox()
                  ],
                ),
              );
      }),
    );
  }
}
