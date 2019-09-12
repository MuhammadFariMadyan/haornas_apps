import 'package:flutter/material.dart';
import 'package:haornas_apps/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return HomePage();
          },
        ),
      );
    });
    return SafeArea(
      child: Scaffold(
        body: new Center(
            child: Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(5.0)),
            Image.asset(
              'images/eudeka-maskot.jpg',
              height: 505.0,
              width: 900.0,
            ),
            new Padding(padding: new EdgeInsets.all(5.0)),
            CircularProgressIndicator(),
          ],
        )),
      ),
    );
  }
}
