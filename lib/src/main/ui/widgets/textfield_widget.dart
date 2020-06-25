import 'package:digitalkaimur/src/res/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  bool isRound;
  final String hintText;
  final int minLine;
  final Function onChanged;
  final TextEditingController controller;
  Color color;
  TextInputType keyboardType;
  bool obscureText;
  int maxLength;
  double letterSpacing;

  TextFieldWidget(
      {this.isRound = true,
      this.hintText,
      this.minLine,
      this.onChanged,
      this.controller,
      this.color,
      this.keyboardType,
      this.obscureText = false,
      this.maxLength,
      this.letterSpacing,
      });

  @override
  Widget build(BuildContext context) {
    if (isRound) {
      return Container(
        child: TextField(
          maxLines: minLine,
          maxLength: maxLength,
          onChanged: onChanged,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyle(
              fontFamily: AppFonts.font,
              letterSpacing:letterSpacing,
              fontSize: 15,
              fontWeight: FontWeight.w100),
          textCapitalization: TextCapitalization.sentences,
          controller: controller,
          autofocus: false,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
              hintText: hintText,
              counterText: '',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red[200], width: 8.0),
              )),
        ),
      );
    } else {
      return Container(
          child: TextField(
              minLines: 1,
              style: TextStyle(
                  fontFamily: AppFonts.font,
                  fontSize: 15,
                  height: 1.4,
                  color: color,
                  fontWeight: FontWeight.w700),
              controller: controller,
              autofocus: true,
              onChanged: onChanged,
              autocorrect: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                  hintText: hintText,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: TextStyle(
                    color: color,
                    fontSize: 15.0,
                  ),
                  fillColor: color,
                  filled: false)));
    }
  }
}
