import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:munch_app/components/app.dart';
import 'package:munch_app/screens/login_screen.dart';
import 'package:munch_app/screens/registeration_screen.dart';

import '../constants/routes.dart';

class RouterPage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {

      // case "/":
      //   builder = (BuildContext context) => SignUp();
      //   break;
      case mLoginScreen:
        builder = (BuildContext context) => Login();
        break;
      case mRegisterScreen:
        builder = (BuildContext context) => SignUp();
        break;
      default:
        builder = (BuildContext context) => App(currentIndex: settings.name);
    }

    // throw Exception('Invalid route: ${settings.name}');

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
