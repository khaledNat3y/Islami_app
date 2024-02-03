import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/xoGame/game_x_o.dart';

class Splash extends StatefulWidget {
  static const routeName="splash";
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}
class SplashState extends State {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Future.delayed(Duration(seconds: 3,),(){
     Navigator.of(context).pushReplacementNamed(XOGame.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset("assets/images/Group 8.png"),
      ),
    );
  }
}