import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_assets.dart';
import 'home_screen.dart';

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
    Future.delayed(Duration(seconds: 2,),(){
     Navigator.of(context).pushReplacementNamed(Home.routeName);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(AppAssets.splash)
      ),
    );
  }
}