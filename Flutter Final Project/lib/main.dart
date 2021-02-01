import 'package:docker_integration/aboutus.dart';
import 'package:docker_integration/home.dart';
import 'package:docker_integration/login.dart';
import 'package:docker_integration/output.dart';
import 'package:docker_integration/splash.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

String cmd;
var x = "Enter command to show output";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      'login': (context) => Login(),
      'home': (context) => MyHome(),
      'dialog': (context) => AlertBox(),
      'output': (context) => Output(),
      'about': (context) => About(),
      'splash': (context) => SplashScreen(),
    },
    initialRoute: 'splash',
  ));
}
