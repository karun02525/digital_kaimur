import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  final List<SelectCityModel> cityList;
  final int cityId;
  DialogWidget(this.cityList,this.cityId);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  int selectId=1;

  @override
  void initState() {
    selectId=widget.cityId;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: () async {
          return false;
        },
    child:AlertDialog(
      title: Text("Select City Name"),
      content: SingleChildScrollView(
        child:Container(
          child: Column(
            children:
            widget.cityList.map((data) => RadioListTile(
              title: Text("${data.eng} (${data.hi} )"),
              groupValue: selectId,
              value: data.cid,
              activeColor: Colors.blueAccent,
              selected: selectId == data.cid,
              onChanged: (val) {
                setState(() {
                  debugPrint("select item: ${data.eng}");
                  selectId = data.cid;
                  debugPrint("select item selectId : $selectId");
                });
              },
            )).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        MaterialButton(
          elevation: 6.0,
          child: Text("Done"),
          onPressed: () {
            Navigator.of(context).pop(selectId);
          },
        )
      ],
    ));
  }
}


class SelectCityModel{
  int cid;
  String eng;
  String hi;
  SelectCityModel({this.cid,this.eng,this.hi});

  static List<SelectCityModel> getCityList(){
    return [
      SelectCityModel(cid:0,eng:'Pusauli',hi:'पुसौली'),
      SelectCityModel(cid:1,eng:'Mohania',hi:'मोहनिया'),
      SelectCityModel(cid:2,eng:'Kudra',hi:'कुदरा'),
      SelectCityModel(cid:3,eng:'Bhabhua',hi:'भभुआ'),
      SelectCityModel(cid:4,eng:'Ramgarh',hi:'रामगढ'),
      SelectCityModel(cid:5,eng:'Nuaon',hi:'नुआओं'),
      SelectCityModel(cid:6,eng:'Durgawati',hi:'दुर्गावती'),
      SelectCityModel(cid:7,eng:'Chand',hi:'चाँद'),
      SelectCityModel(cid:8,eng:'Sonhan',hi:'सोनहन'),
    ];
  }
}

