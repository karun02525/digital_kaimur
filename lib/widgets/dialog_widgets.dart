import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {

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
    return Container(
      child: Column(
        children: createRadioListUsers(),
      ),
    );
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

