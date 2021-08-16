import 'package:flutter/cupertino.dart';
import 'package:munch_app/app_view.dart';
import 'package:munch_app/dependency.dart';
import 'package:munch_app/models/language.dart';
import 'package:munch_app/constants/constants.dart';
import 'package:munch_app/services/data_service.dart';

class UiProvider with ChangeNotifier {
  bool loggedIn = true;
  final dataService = service<DataService>();

  void changeState() {
    if (loggedIn == false) {
      loggedIn = true;
    } else {
      loggedIn = false;
    }
    notifyListeners();
  }

  void changeLanguage(BuildContext context) {
    // Navigator.pushReplacementNamed(context, mLoginScreen)
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