import 'package:flutter/cupertino.dart';

class UiProvider with ChangeNotifier {
  String title = "Ahmad";
  void onTap() {
    title = "Khaled";
    notifyListeners();
  }
}
