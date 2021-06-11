import 'package:flutter/material.dart';
import 'package:munch_app/dependency.dart' as dep;
import 'app_view.dart';

void main() async {
  dep.init();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  return runApp(
    AppView(),
  );
}
