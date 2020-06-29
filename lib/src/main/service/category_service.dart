

import 'dart:async';
import 'dart:convert';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/model/user_model.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class Service{
    static Future<List<DataList>> getCategory() async{
      try {
        final response = await Dio().get(Config.getCategoryUrl);
        debugPrint("Category response: "+Config.getCategoryUrl);
        debugPrint("Category response 2: "+response.data.toString());
        if (response.statusCode == 200) {
              return categoryModelFromJson(response.data).data;
        } else {
          return List<DataList>();
        }
      } on Exception catch (e) {
        return List<DataList>();
      }
    }

    static void loginUser(String mobile, String password) async {
      Dio dio = new Dio();
      dio.options.responseType = ResponseType.json;
      try {


        var params = {"mobile": '8920828585', "password": '11111111'};
        debugPrint("User Data Login params: " + params.toString());
        final response = await dio.post(Config.loginUrl, data: params,
          options: Options(
            responseType: ResponseType.json,
          ),
        );
       /* final response = await http.post(Config.loginUrl,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },body: jsonEncode(<String, String>{
            "mobile": '8920828585', "password": '11111111'
          }),
            );*/
        //debugPrint("User Data Login loginUrl: " + Config.loginUrl.toString());
        debugPrint("User Data Login loginUrl api: "+response.data.toString());
        debugPrint("User Data Login loginUrl api json: "+jsonEncode(response.data));

        UserModel model;

        if (response.statusCode == 200) {
          model=userModelFromJson(jsonEncode(response.data));
          debugPrint("User Data Login loginUrl message : "+model.message);
          debugPrint("User Data Login loginUrl message : "+model.data.email);
        } else {

        }
      } on DioError catch (e) {
        var errorMessage = jsonDecode(jsonEncode(e.response.data));
        var statusCode = e.response.statusCode;
        if (statusCode == 400) {
          Global.toast(errorMessage['message']);
        } else if (statusCode == 401) {
          Global.toast(errorMessage['message']);
        } else if (statusCode == 404) {
          Global.toast(errorMessage['message']);
        } else {
          Global.toast('Something went wrong');
        }
      }
    }
}