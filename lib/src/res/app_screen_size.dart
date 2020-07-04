import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AppSize{
  static height(context) =>MediaQuery.of(context).size.height;
  static width(context)=> MediaQuery.of(context).size.width;
}