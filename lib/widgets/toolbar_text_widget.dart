import 'package:digitalkaimur/res/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  TextWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title,

      )
    );
  }
}