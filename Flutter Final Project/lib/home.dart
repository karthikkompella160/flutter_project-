import 'dart:io';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

String cmd;
var mainoutput = "Enter command to show output";
String ip = "192.168.1.3";
double fontsize = 20;

class MyHome extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> getout(String cmd2) async {
      try {
        var url = 'http://$ip/cgi-bin/aws.py?x=$cmd2';

        var response = await http.get(url).timeout(Duration(seconds: 20));
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
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 0.1)),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(50),
              height: 200,
              width: 300,
              child: Image.asset("lib/images/LOGO.png",
                  alignment: Alignment.center, fit: BoxFit.fitWidth),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'My AWS account',
                  style: TextStyle(fontSize: fontsize * 0.6),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.popAndPushNamed(context, "dialog");
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'About EC2-Assist',
                  style: TextStyle(fontSize: fontsize * 0.6),
                ),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pushNamed(context, 'about');
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Version : 1.0.0',
                  style: TextStyle(fontSize: fontsize * 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Current Region : ap-south-1",
          textScaleFactor: 0.8,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.white,
              //Colors.white,
              Color.fromRGBO(246, 141, 17, 50),
            ])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await getout("listins");
                      Navigator.pushNamed(context, "output");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderOnForeground: true,
                      elevation: 20,
                      shadowColor: Colors.white,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(246, 141, 17, 1),
                          ),
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          width:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          child: ListTile(
                            title: Text(
                              "Instances\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Launch, Create and Manage EC2-Instances",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await getout("listkp");
                      await Navigator.pushNamed(context, "output");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderOnForeground: true,
                      elevation: 20,
                      shadowColor: Colors.white,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(246, 141, 17, 1),
                          ),
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          width:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          child: ListTile(
                            title: Text(
                              "KeyPairs\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Create, Delete and Manage KeyPairs",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await getout("listsg");
                      Navigator.pushNamed(context, "output");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderOnForeground: true,
                      elevation: 20,
                      shadowColor: Colors.white,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(246, 141, 17, 1),
                          ),
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          width:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          child: ListTile(
                            title: Text(
                              "Sg-Groups\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Attach, Create and Manage Security Groups",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await getout("listimg");
                      Navigator.pushNamed(context, "output");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderOnForeground: true,
                      elevation: 20,
                      shadowColor: Colors.white,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(246, 141, 17, 1),
                          ),
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          width:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          child: ListTile(
                            title: Text(
                              "AMI's\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "Create and Manage Amazon Machine Images",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await getout("listvol");
                      Navigator.pushNamed(context, "output");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderOnForeground: true,
                      elevation: 20,
                      shadowColor: Colors.white,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(246, 141, 17, 1),
                          ),
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          width:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          child: ListTile(
                            title: Text(
                              "Volumes\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Launch, Create and Manage EBS-Volumes",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await getout("listvpcs");
                      await Navigator.pushNamed(context, "output");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderOnForeground: true,
                      elevation: 20,
                      shadowColor: Colors.white,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(246, 141, 17, 1),
                          ),
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          width:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          child: ListTile(
                            title: Text(
                              "VPC's\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Create, Delete and Manage VPC's",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await getout("listsg");
                      Navigator.pushNamed(context, "output");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderOnForeground: true,
                      elevation: 20,
                      shadowColor: Colors.white,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(246, 141, 17, 1),
                          ),
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          width:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          child: ListTile(
                            title: Text(
                              "Load Balancers\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Create and Manage Load Balancers",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await getout("listimg");
                      Navigator.pushNamed(context, "output");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      borderOnForeground: true,
                      elevation: 20,
                      shadowColor: Colors.white,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(246, 141, 17, 1),
                          ),
                          height:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          width:
                              MediaQuery.of(context).size.shortestSide * 0.45,
                          child: ListTile(
                            title: Text(
                              "Subnets's\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Create and Manage Subnets",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class AlertBox extends StatefulWidget {
  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(246, 141, 17, 1),
              ),
              alignment: Alignment.center,
              child: Text(
                "AWS Credentials",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          content: Container(
            child: Text(
              "  Access Key : $accesskey\n  Secret Key : $secretkey",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            FloatingActionButton(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                onPressed: () => {Navigator.popAndPushNamed(context, "home")})
          ],
        ),
      ),
    );
  }
}
