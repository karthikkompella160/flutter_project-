import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About EC2-Assist",
          textScaleFactor: 0.8,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                  elevation: 40,
                  color: Colors.black,
                  child: Text(
                    " \t\tDevelopers\t\t ",
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 2.0,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://avatars3.githubusercontent.com/u/64470942?s=400&v=4"),
                        )),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.bottomCenter,
                            image: AssetImage(
                              "lib/images/kk.jpeg",
                            ))),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 100),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40)),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      "Venu Dadi",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 100),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40)),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      "Karthik Kompella",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  """I (venu) and my friend (karthik) wanted to something as a project Oneday we came to up with this idea to make a mobile application which can control the AWS instances and their states with much more functionalities. 
Creative head: Right from the start loginpage and the flow of the programming user friendly Output in a redable format are perfectly planned by "karthik".
Backend Control and execution: The entire backend services and the code written by "venu", using Different API's and intergrating required technologies to acheive the planned output.
We always fond of creating new things and doing all this on our own makes this one special.""",
                  maxLines: 50,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.white,
                Color.fromRGBO(246, 141, 17, 50),
              ])),
        ),
      ),
    );
  }
}
