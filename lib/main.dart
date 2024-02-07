import 'package:flutter/material.dart';
import 'package:new_app/screens/home/home_screen.dart';
import 'package:new_app/screens/splash/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        Home.routeName:(_)=>Home(),
        Splash.routeName:(_)=>Splash(),
      },
      initialRoute: Home.routeName,
    )
  );
  ///Made with ♥ by Khaled Nat3y.
}
