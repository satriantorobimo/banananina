import 'dart:async';

import 'package:banananina/routes.dart';
import 'package:banananina/screen/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  // FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runZoned<Future<void>>(() async {
    runApp(MyApp());
  }, onError: Crashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banananina',
      theme: ThemeData(primaryColor: Colors.black, fontFamily: 'JosefinSans'),
      home: SplashScreen(),
      routes: routes,
    );
  }
}
