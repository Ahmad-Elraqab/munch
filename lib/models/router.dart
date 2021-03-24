import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:munch_app/constants/routes.dart';
import 'package:munch_app/components/app.dart';
import '../constants/routes.dart';

class RouterPage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case "/":
        builder = (BuildContext context) => App(currentIndex: settings.name);
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
