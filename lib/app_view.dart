import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:munch_app/localization/demo_localization.dart';
import 'models/router.dart';
import 'package:munch_app/constants/constants.dart';

// ignore: must_be_immutable
class AppView extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _AppViewState state = context.findAncestorStateOfType<_AppViewState>();
    state.setLocale(locale);
  }

  bool isEnglish;

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  Locale _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      localizationsDelegates: [
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeListResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          for (var d in deviceLocale) {
            if (locale.languageCode == d.languageCode &&
                locale.countryCode == d.countryCode) {
              d.countryCode == "SA" ? isEnglish = false : isEnglish = true;
              return d;
            }
          }
        }

        return supportedLocales.first;
      },
      locale: _locale,
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.pink,
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
      ),
      onGenerateRoute: RouterPage.generateRoute,
      initialRoute: '/',
      // initialRoute: kRestaurantHomePage,
    );
  }
}
