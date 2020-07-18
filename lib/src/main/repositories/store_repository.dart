import 'dart:convert';
import 'dart:io';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/user_model.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


class StoreRespository {
  BuildContext context;
  StoreRespository(BuildContext cnt){
    this.context=cnt;
  }


  //Store Register
  Future<bool> storeRegister(File file) async {
    var dio =CustomDio.withAuthentication().instance;
    dio.options.headers["Content-Type"] = "multipart/form-data";
    FormData formData = FormData.fromMap({
      "user_avatar": await MultipartFile.fromFile(file.path,filename: "pic.png")
    });
    return await dio.post(Config.imageUpdateUrl, data: formData).then((res) async {
      if (res.statusCode == 200) {
        final responseBody = jsonDecode(jsonEncode(res.data));
        print('************Profile upload******______________**************');
        print(responseBody.toString());
        if (responseBody['status']) {
           UserPreference().avatar=responseBody['data']['user_avatar'];
          return true;
        }}
    }).catchError((e) {
      return ApiErrorHandel.errorHandel(context,e);
    });
  }





  void saveData(LoginData res) async {
    var pref = UserPreference();
    pref.name = res.name;
    pref.email = res.email;
    pref.name = res.name;
    pref.mobile = res.mobile;
    pref.token = res.token;
    pref.avatar = res.userAvatar;
    pref.isLogin = true;
  }
}
