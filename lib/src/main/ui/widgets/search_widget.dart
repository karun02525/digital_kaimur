import 'package:digitalkaimur/src/main/ui/product/scanner_barcode.dart';
import 'package:digitalkaimur/src/res/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

class TextSearchWidget extends StatelessWidget {
  final String hintText;
  final int minLine;
  final Function onChanged;
  final TextEditingController controller;

  TextSearchWidget({
    this.hintText,
    this.minLine,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      color: Colors.white,
      child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Icon(Icons.search, color: Colors.black, size: 25.0),
                flex: 0,
              ),
              SizedBox(
                width: 12.0,
              ),
              Expanded(
                  child: TextWidget(
                title: "Search",
                color: Colors.black,
              )),
              Expanded(
                  child: IconButton(
                    onPressed: () {ScannerController(context: context);},
                    icon: Icon(AppIcons.ic_scanner, color: Colors.black),
                  ),
                  flex: -1),
            ],
          )),
    );
  }
}
