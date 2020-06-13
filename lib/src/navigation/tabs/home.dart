import 'package:digitalkaimur/res/strings.dart';
import 'package:digitalkaimur/widgets/dialog_widgets.dart';
import 'package:digitalkaimur/widgets/toolbar_text_widget.dart';
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
  int cityId=0;
  String selectName="Select City";

  @override
  void initState() {
    super.initState();
    cityList = SelectCityModel.getCityList();
  }

  selectCity(int selectValue){
     setState(() {
       cityId=selectValue;
       selectName="${cityList[selectValue].eng} (${cityList[selectValue].hi})";
     });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
    ));

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 2.0,
          title: Column(
            children: <Widget>[
              TextWidget(AppString.appName),
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                      return DialogWidget(cityList,cityId);
                    }).then((value) => {
                         selectCity(value)
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(selectName,style: TextStyle(fontSize: 16.0),),
                      Icon(Icons.arrow_drop_down)
                    ],
                  )),
            ],
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
        ),
        drawer: NavigationDrawer(),
        body: Container(
            color: Colors.white
        )
    );
  }
}
