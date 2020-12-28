import 'dart:ui';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
String email;
String password;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Welcome User!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          decorationColor: Colors.black54)),
                ),
                SizedBox(width: 10, height: 15),
                SizedBox(
                  height: 55,
                  width: 50,
                  child: Container(child: Image.asset("lib/images/LOGO.png")),
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
                  height: 200,
                  width: 40,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (val){
                            email=val;
                            
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
                          focusedBorder:InputBorder.none,  
                                                 
                              labelText: "Access-Key",
                             
                              counterStyle: TextStyle(fontSize: 15),
                              focusColor: Colors.black,
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: TextField(
                           onChanged: (val){
                             password=val;
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
                           focusedBorder:InputBorder.none,  
                          
                              counterStyle: TextStyle(fontSize: 10),
                              focusColor: Colors.black,
                              labelStyle: TextStyle(color: Colors.black)),
                      ),
                       )
                    ],
                  )),
            ),
            SizedBox(height:15),
            
           GestureDetector(
child: Container(alignment: Alignment.bottomRight,
child: Text("Forget password? ",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold), )),

           ),
           SizedBox(height: 10,),
        Center(
          child: SizedBox(
            height: 30,
            width: 120,
                      child: RaisedButton(
              shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
  side: BorderSide(color: Colors.red),
),
              onPressed: (){
                print(email);
                print(password);
              },
              splashColor: Colors.white,
               color: Color.fromRGBO(246, 141, 17, 1),
               child: Text("login", style: TextStyle(fontSize: 20),),
              ),
          ),
          ),
          SizedBox(height:20),
                  Center(
          child: SizedBox(
            height: 30,
            width: 120,
                      child: RaisedButton(
              shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
  side: BorderSide(color: Colors.red),
),
              onPressed: (){
                print("sinup page");
              },
              splashColor: Colors.white,
               color: Color.fromRGBO(246, 141, 17, 1),
               child: Text("sign-up", style: TextStyle(fontSize: 20),),
              ),
          ),
          ),
          ]
        ),
      ),
    );
  }
}



