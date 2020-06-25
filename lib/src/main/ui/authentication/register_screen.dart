import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/service/category_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<Datum> list;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading=true;
    Service.getCategory().then((value){
        list=value;
        _loading=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: _loading ? Container(child: Center(child: CircularProgressIndicator())):
          Container(
            child: ListView.builder(
                itemCount:null==list? 0:list.length,
                itemBuilder: (context,index){
                  Datum item= list[index];
                 return ListTile(
                    title: Text(item.categoryPostion.toString()),
                    subtitle: Text(item.categoryName),
                 );
            }),
          )

    );
  }
}
