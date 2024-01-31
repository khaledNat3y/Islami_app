import 'package:flutter/material.dart';

class XOButton extends StatelessWidget {
  final String phase;
  final Function onClick;
  const XOButton({super.key,required this.onClick,required this.phase});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(
              onPressed:(){
                onClick(phase);
              },
              child: Text(phase,
                style: TextStyle(fontSize: 24,color: Colors.black),))),
    );
  }
}