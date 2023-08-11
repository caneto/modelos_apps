/*
this is the first pages of the apps
you can use logic to direct the pages to home.dart or signin.dart
this demo is direct to login.dart
We use CupertinoPageTransitionsBuilder in this demo
If you want to use default transition, then remove ThemeData Widget below and delete theme attribute
If you want to show debug label, then change debugShowCheckedModeBanner to true
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijtrackerflutter/config/constants.dart';
import 'package:ijtrackerflutter/ui/signin.dart';

void main() {
  // set orientation always portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // cupertino animation
      theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          })
      ),
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      home: SigninPage(),
    );
  }
}