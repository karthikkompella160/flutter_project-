

import 'package:awsapp/login.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        
        body: Login()    // replaced login() with Alert box and for testing i kept Connection to both snackbar and alertbox
      ),
    );
  }
}
// ignore: must_be_immutable
class AlertBox  extends StatelessWidget {
   String data;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("AWS"),
      actions: [
      RaisedButton(onPressed: (){
         snackbar(context); // called snackbar here too 
      },
      child:Text("Ok"))
      ],
      shape:RoundedRectangleBorder() ,
      titlePadding: EdgeInsets.symmetric(),
    );
  }
}


Future<void> snackbar(BuildContext context)
async {

SnackBar snackBar=SnackBar(content: Text("i am called"),
action: SnackBarAction(onPressed: (){},label: "click!",),);
Scaffold.of(context).showSnackBar(snackBar);
}
