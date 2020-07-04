import 'package:digitalkaimur/src/res/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextSpanWidget extends TextSpan {
  final String title;
  bool isBold;
  Color color;
  double top;
  double bottom;
  double fontSize;
  double ls;
  int maxLines;
  TextOverflow overflow;

  TextSpanWidget({
    this.title,
    this.color,
    this.isBold = false,
    this.top = 0.0,
    this.bottom = 0.0,
    this.fontSize = 15.0,
    this.maxLines = 7,
    this.overflow,
    this.ls,
  });



}
