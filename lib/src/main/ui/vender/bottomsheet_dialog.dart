import 'dart:convert';
import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/ui/widgets/button_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/dropdown_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VenderVerify extends StatefulWidget {
  @override
  _VenderVerifyState createState() => _VenderVerifyState();
}

class _VenderVerifyState extends State<VenderVerify> {

  List categoryList;
  String catId;
  Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio();
    getCategoryAllAsync();
  }

  void getCategoryAllAsync() async {
    try {
      final response = await dio.get(Config.getAllCategoryUrl);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(jsonEncode(response.data));
        if (responseBody['status']) {
          setState(() {
            categoryList = responseBody['data'];
          });
        }
      }
    } on DioError catch (e) {
      var errorMessage = jsonDecode(jsonEncode(e.response.data));
      var statusCode = e.response.statusCode;

      debugPrint("print: error :" + errorMessage.toString());
      debugPrint("print: statusCode :" + statusCode.toString());

      if (statusCode == 400) {
        Global.toast(errorMessage['message']);
      } else if (statusCode == 401) {
        Global.toast(errorMessage['message']);
      } else {
        Global.toast('Something went wrong');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0,top: 10.0,bottom: 5.0),
            child: TextWidget(title: 'Verification For Vender',color: Colors.green,fontSize: 18.0,isBold: true,),
          ),
          Divider(),

          Container(
            margin: EdgeInsets.only(left: 30.0,right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0,),
                TextWidget(title: 'Name:   Karun Kumar',isBold: true,),
                SizedBox(height: 10.0,),
                TextWidget(title: 'Mobile:  +91 8920828585',isBold: true,),
                SizedBox(height: 10.0,),
                TextWidget(title: 'Email Id:  karunkumar@gmail.com',fontSize: 13.0,isBold: true,),


                SizedBox(height: 30.0,),
                DropdownWidget(
                  hint: 'Select category',
                  value: catId,
                  items: categoryList?.map((item) {
                    return DropdownMenuItem(
                      value: item['id'],
                      child: Text(item['cname']),
                    );
                  })?.toList(),
                  onChanged: (newValue) {
                    setState(() {
                      catId = newValue;
                    });
                  },
                ),

                SizedBox(height: 30.0,),
                ButtonWidget(title: 'Submit',color: Colors.blue,onPressed: (){},isBold: true,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
