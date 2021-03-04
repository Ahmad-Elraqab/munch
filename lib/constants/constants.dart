import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:munch_app/localization/demo_localization.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).getTranslatedValue(key);
}
