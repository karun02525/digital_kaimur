import 'package:flutter/material.dart';

class DialogWidget extends StatefulWidget {
  final List<SelectCityModel> cityList;
  final int cityId;
  DialogWidget(this.cityList,this.cityId);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  int selectId=0;
  bool _isButtonDisabled=true;
  bool _isButtonCancelDisabled=true;

  @override
  void initState() {
    setState(() {
      selectId=widget.cityId;
      if(widget.cityId>0){
        _isButtonCancelDisabled=false;
      }
    });
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
          margin: EdgeInsets.only(left: 20.0,right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            widget.cityList.map((data) => RadioListTile(
              title: Text("${data.eng} (${data.hi} )"),
              groupValue: selectId,
              value: data.cid,
              activeColor: Colors.blueAccent,
              selected: selectId == data.cid,
              onChanged: (val) {
                setState(() {
                  if(widget.cityId>0){
                    _isButtonCancelDisabled=false;
                  }
                  if(widget.cityId==data.cid){
                    _isButtonDisabled=true;
                  }else{
                    _isButtonDisabled=false;
                  }

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

          color: Colors.blue,
          child: Text("Cancel"),
          onPressed:  _isButtonCancelDisabled ? null : () {
            Navigator.of(context).pop(selectId);
          },
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left:8.0,right: 10.0),
          child: MaterialButton(
            elevation: 6.0,
            disabledColor: Colors.grey,
            color: Colors.green,
            child: Text("Done"),
            onPressed:  _isButtonDisabled ? null : () {
              Navigator.of(context).pop(selectId);
            },
          ),
        ),
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


/*
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
},*/
