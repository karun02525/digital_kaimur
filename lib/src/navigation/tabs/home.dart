import 'package:digitalkaimur/res/strings.dart';
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
  SelectCityModel selectedCity;


  @override
  void initState() {
    super.initState();
    cityList = SelectCityModel.getCityList();
  }


  setSelectedCity(SelectCityModel model) {
    setState(() {
      selectedCity  = model;
    });
  }


  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];
    for (SelectCityModel model in cityList) {
      widgets.add(
        RadioListTile(
          value: model,
          groupValue: selectedCity,
          title: Text(model.eng),
          subtitle: Text(model.hi),
          onChanged: (currentUser) {
            print("Current User ${currentUser.hi}");
            setSelectedCity(currentUser);
          },
          selected: selectedCity == model,
          activeColor: Colors.green,
        ),
      );
    }
    return widgets;
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
           child: Column(
             children: createRadioListUsers(),
           ),
        ));
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



class SelectCityModel{
  int id;
  String eng;
  String hi;
  SelectCityModel({this.id,this.eng,this.hi});

  static List<SelectCityModel> getCityList(){
    return [
      SelectCityModel(id:1,eng:'Pusauli',hi:'पुसौली'),
      SelectCityModel(id:2,eng:'Mohania',hi:'मोहनिया'),
      SelectCityModel(id:3,eng:'Kudra',hi:'कुदरा'),
      SelectCityModel(id:4,eng:'Bhabhua',hi:'भभुआ'),
      SelectCityModel(id:5,eng:'Ramgarh',hi:'रामगढ'),
      SelectCityModel(id:6,eng:'Nuaon',hi:'नुआओं'),
      SelectCityModel(id:7,eng:'Durgawati',hi:'दुर्गावती'),
      SelectCityModel(id:8,eng:'Chand',hi:'चाँद'),
      SelectCityModel(id:9,eng:'Sonhan',hi:'सोनहन'),
    ];
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
