import 'package:flutter/material.dart';
import 'package:new_app/xoGame/xo_button.dart';

class XOGame extends StatefulWidget {
  static String routeName="XOGame";
  @override
  State<StatefulWidget> createState() {
    return XOGameState();
  }

}
class XOGameState extends State {
  List<String>xoBoard=[
    "","","",
    "","","",
    "","","",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("XO-Game"),),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Player1"),
                Text("Player2"),
              ],
            ),
          ),
          ///number rows
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XOButton(onClick: onButtonClick,phase: xoBoard[0],),
                XOButton(onClick: onButtonClick,phase: xoBoard[1],),
                XOButton(onClick: onButtonClick,phase: xoBoard[2],),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XOButton(onClick: onButtonClick,phase: xoBoard[3],),
                XOButton(onClick: onButtonClick,phase: xoBoard[4],),
                XOButton(onClick: onButtonClick,phase: xoBoard[5],),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XOButton(onClick: onButtonClick,phase: xoBoard[6],),
                XOButton(onClick: onButtonClick,phase: xoBoard[7],),
                XOButton(onClick: onButtonClick,phase: xoBoard[8],),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onButtonClick(String phase) {
    int counter=0;
    counter % 2 == 0 ? "o":"x";
    counter++;

    setState(() {});
  }
}