import 'package:flutter/material.dart';
import 'package:new_app/screens/hadeth_details/hadeth_details.dart';
import 'package:new_app/screens/home/home_screen.dart';
import 'package:new_app/screens/splash/splash_screen.dart';
import 'package:new_app/screens/sura_details/sura_details.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        Home.routeName:(_)=>Home(),
        Splash.routeName:(_)=>Splash(),
        SuraDetails.routeName:(_)=>SuraDetails(),
        HadethDetails.routeName:(_)=>HadethDetails(),
      },
      initialRoute: Home.routeName,
    )
  );
  ///Made with ♥ by Khaled Nat3y.
}
