import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.pushNamed(context, "login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.white),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 100.0,
                              child: Image.asset("lib/images/LOGO.png")),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 250,
                      ),
                      CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Padding(padding: EdgeInsets.all(20.0)),
                      Text(
                        "Launching awsbuddy",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
