import 'package:flutter/cupertino.dart';
import 'package:munch_app/models/user.dart';
import 'package:munch_app/services/data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dependency.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  String title;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController rememeberController = new TextEditingController();
  final data = service<DataService>();
  User user;

  Future<void> login(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    user =
        await data.loginServer(emailController.text, passwordController.text);

    if (user.loginStatus == 1) {
      emailController.text = "";
      passwordController.text = "";
      isError = false;
      isLoading = false;
      prefs.setString("user_id", user.customerGuid);
      prefs.setBool("isAuth", true);
      return Navigator.pop(context);
    } else {
      isError = true;
      isLoading = false;
      notifyListeners();
    }
  }

  void setLoading() {
    isLoading = true;
    notifyListeners();
  }

  void clearBoard() {
    emailController.text = "";
    passwordController.text = "";
    isError = false;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<bool> getSharedPrefrence() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool("isAuth");
  }
}