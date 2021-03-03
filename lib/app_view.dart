import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/router.dart';
import 'package:munch_app/providers/user_provider.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.pink,
          accentColor: Colors.pink,
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
        ),
        onGenerateRoute: RouterPage.generateRoute,
        initialRoute: '/',
        // initialRoute: kRestaurantHomePage,
      ),
    );
  }
}
