import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/router.dart';
import 'package:munch_app/providers/ui_provider.dart';

class AppView extends StatefulWidget {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   widget._firebaseMessaging.configure(
  //     onMessage: (Map<String, dynamic> message) async {
  //       print('onMessage: $message');
  //     },
  //     onLaunch: (Map<String, dynamic> message) async {
  //       print('onLaunch: $message');
  //     },
  //     onResume: (Map<String, dynamic> message) async {
  //       print('onResume: $message');
  //     },
  //   );
  //   widget._firebaseMessaging.requestNotificationPermissions(
  //       const IosNotificationSettings(sound: true, badge: true, alert: true));
  // }

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
