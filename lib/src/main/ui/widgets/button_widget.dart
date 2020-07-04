import 'package:digitalkaimur/src/res/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  bool isBold;
  Color color;
  ButtonWidget({this.title,this.isBold=false,this.onPressed,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 3.0),
        child:SizedBox(
          width: double.infinity,
          height: 50.0,
         child: isBold ? RaisedButton(
          color:color,
          textColor: Colors.white,
          splashColor: Colors.purpleAccent,
          onPressed:onPressed,
          child: Text(title,
              style: TextStyle(
                  fontFamily: AppFonts.font, fontSize: 15, fontWeight: FontWeight.w700)),
        ):RaisedButton(
          color:color,
          textColor: Colors.white,
          splashColor: Colors.purpleAccent,
          onPressed:onPressed,
          child: Text(title,
              style: TextStyle(
                  fontFamily: AppFonts.font, fontSize: 15, fontWeight: FontWeight.w100)),
        )));
  }
}
