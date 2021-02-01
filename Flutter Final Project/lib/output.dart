import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'home.dart';

class Output extends StatefulWidget {
  @override
  _OutputState createState() => _OutputState();
}

class _OutputState extends State<Output> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      print(mainoutput);
    });

    Future<void> getout(String cmd2) async {
      try {
        var url = 'http://$ip/cgi-bin/aws.py?x=$cmd2';

        var response = await http.get(url);
        setState(() {
          mainoutput = response.body;
          print(mainoutput);
        });
        // ignore: unnecessary_statements
      } on SocketException catch (err) {
        setState(() {
          mainoutput =
              "Your Backend is down and the reason is : ${err.osError.message}";
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Current Region : ap-south-1",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.white,
              //Colors.white,
              Color.fromRGBO(246, 141, 17, 50),
            ])),
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Text(
            mainoutput,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RaisedButton(
            elevation: 30,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20))),
            onPressed: () async {
              await getout("createins");
              await getout("listins");
              await Navigator.popAndPushNamed(context, "output");
            },
            hoverColor: Colors.red,
            splashColor: Colors.red,
            child: Text(
              "Create Resources",
              textAlign: TextAlign.center,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          RaisedButton(
            elevation: 30,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20))),
            onPressed: () async {
              await getout("rmins");
              await getout("listins");
              await Navigator.popAndPushNamed(context, "output");
            },
            hoverColor: Colors.red,
            splashColor: Colors.red,
            child: Text(
              "Delete Resources",
              textAlign: TextAlign.center,
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
