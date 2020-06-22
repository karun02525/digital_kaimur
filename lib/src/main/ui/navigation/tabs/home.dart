import 'dart:async';
import 'package:digitalkaimur/src/main/ui/widgets/carousel_slider.dart';
import 'package:digitalkaimur/src/main/ui/widgets/dialog_widgets.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../drawer_navigation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SelectCityModel> cityList;
  int cityId = -1;
  String selectName = "Select City";
  String _valProvince;
  bool isSelect = false;

  @override
  void initState() {
    super.initState();
    cityList = SelectCityModel.getCityList();

    Timer(Duration(seconds: 1), () =>openDialog() );
  }

  selectCity(int selectValue) {
    setState(() {
      cityId = selectValue;
      selectName = "${cityList[selectValue].eng} (${cityList[selectValue].hi})";
    });
  }

  void openDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return DialogWidget(cityList, cityId);
        }).then((value) => {

      selectCity(value)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 2.0,
          title: Column(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    openDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextWidget(title: selectName, isBold: true),
                      Icon(Icons.arrow_drop_down)
                    ],
                  )),
            ],
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () { Navigator.pushNamed(context, '/search');},
              icon: Icon(Icons.search),
            )
          ],
        ),
        drawer: NavigationDrawer(),
        body: Container(color: Colors.white,
          child: FullscreenSlider(),
        ));
  }
}
