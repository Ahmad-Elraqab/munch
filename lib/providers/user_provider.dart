import 'package:flutter/cupertino.dart';
import 'package:munch_app/app_view.dart';
import 'package:munch_app/models/language.dart';
import 'package:munch_app/constants/constants.dart';

class UiProvider with ChangeNotifier {
  BuildContext context;
  bool loggedIn = true;

  void changeState() {
    if (loggedIn == false) {
      loggedIn = true;
    } else {
      loggedIn = false;
    }
    notifyListeners();
  }

  void changeLanguage() {
    // Navigator.pushReplacementNamed(context, mLoginScreen)
    print("object");
    Language language;
    isEnglish == false
        ? language = Language(1, 'English', '', 'en')
        : language = Language(2, 'Arabic', '', 'ar');
    Locale _temp;
    switch (language.languageCode) {
      case 'en':
        _temp = Locale(language.languageCode, 'US');
        break;
      case 'ar':
        _temp = Locale(language.languageCode, 'SA');
        break;
      default:
    }

    AppView.setLocale(context, _temp);
  }
}
