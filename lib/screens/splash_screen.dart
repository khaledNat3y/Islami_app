import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const routeName="splash";
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}
class SplashState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/Group 8.png "),
      ),
    );
  }
}