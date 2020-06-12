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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
    ));

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 2.0,
          title:Column(
            children: <Widget>[
              TextWidget(AppString.appName),
              InkWell(
                onTap:getSelectCity,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextWidget("Pusauli"),
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
           color: Colors.white,
           child:DialogWidget())
    );
  }

  void getSelectCity() {
      showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel:
          MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 900),
          pageBuilder: (BuildContext buildContext, Animation animation,
              Animation secondaryAnimation) {
            return Center(
              child: Container(
                // width: MediaQuery.of(context).size.width - 40,
                // height: MediaQuery.of(context).size.height -  230,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Close",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

}


/*
SimpleItem(1,'Pusauli','पुसौली'),
SimpleItem(2,'Mohania','मोहनिया'),
SimpleItem(3,'Kudra','कुदरा'),
SimpleItem(4,'Bhabhua','भभुआ'),
SimpleItem(5,'Ramgarh','रामगढ'),
SimpleItem(6,'Nuaon','नुआओं'),
SimpleItem(7,'Durgawati','दुर्गावती '),
SimpleItem(8,'Chand','चाँद'),
SimpleItem(9,'Sonhan','सोनहन'),*/
