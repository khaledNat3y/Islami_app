import 'package:flutter/material.dart';
import 'package:new_app/xoGame/game_x_o.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        XOGame.routeName:(_)=>XOGame(),
      },
      initialRoute: XOGame.routeName,
    )
  );
  ///Made with ♥ by Khaled Nat3y.
}
