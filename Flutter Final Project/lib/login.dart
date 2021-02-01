import 'dart:ui';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

String accesskey;
String secretkey;
String username;

final connect = FirebaseFirestore.instance;

//username
//variable -> firebase
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Welcome User!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            decorationColor: Colors.black54)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Container(
                        child: Image.asset(
                      "lib/images/LOGO.png",
                      fit: BoxFit.scaleDown,
                    )),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(246, 141, 17, 1),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (val) {
                                username = val;
                              },
                              cursorColor: Colors.black,
                              cursorHeight: 20,
                              showCursor: true,
                              keyboardAppearance: Brightness.dark,
                              autocorrect: true,
                              cursorRadius: Radius.circular(20),
                              cursorWidth: 2,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.50),
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  labelText: "Username",
                                  counterStyle: TextStyle(fontSize: 15),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (val) {
                                accesskey = val;
                              },
                              cursorColor: Colors.black,
                              cursorHeight: 20,
                              showCursor: true,
                              keyboardAppearance: Brightness.dark,
                              autocorrect: true,
                              cursorRadius: Radius.circular(20),
                              cursorWidth: 2,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.50),
                              decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  labelText: "Access-Key",
                                  counterStyle: TextStyle(fontSize: 15),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (val) {
                                secretkey = val;
                              },
                              cursorColor: Colors.black,
                              cursorHeight: 20,
                              showCursor: true,
                              keyboardAppearance: Brightness.dark,
                              autocorrect: true,
                              cursorRadius: Radius.circular(20),
                              selectionHeightStyle: BoxHeightStyle.tight,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.50),
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: "Secret-key",
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  counterStyle: TextStyle(fontSize: 10),
                                  focusColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.black)),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              SizedBox(height: 15),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white),
                    ),
                    onPressed: () async {
                      await connect
                          .collection("users")
                          .add({"output": username});
                      Navigator.popAndPushNamed(context, 'home');
                    },
                    splashColor: Colors.white,
                    color: Color.fromRGBO(246, 141, 17, 1),
                    child: Text(
                      "Proceed",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    ));
  }
}
