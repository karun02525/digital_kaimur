import 'package:digitalkaimur/src/main/ui/store/store_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return  MapStore();
  }
}
