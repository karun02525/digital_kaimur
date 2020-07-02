import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/user_model.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:flutter/cupertino.dart';


class LoginRespository {
  BuildContext context;
  LoginRespository(BuildContext cnt){
    this.context=cnt;
  }


  Future<bool> loginUser(String mobile, String password) async {
    var params = {"mobile": mobile, "password": password};
    var dio = CustomDio.withAuthentication().instance;
    return await dio.post(Config.loginUrl, data: params).then((res) async {
      if (res.statusCode == 200) {
        LoginData result = userModelFromJson(jsonEncode(res.data)).data;
        saveData(result);
        return true;
      }
    }).catchError((e) {
      return ApiErrorHandel.errorHandel(context,e);
    });
  }

  //Register
  Future<bool> registerUser(name, mob, email, pass, gender) async {
    var params = {
      "name": name,
      "mobile": mob,
      "email": email,
      "password": pass,
      "gender": gender
    };

    var dio =CustomDio.withAuthentication().instance;
    return await dio.post(Config.registerUrl, data: params).then((res) async {
      if (res.statusCode == 201) {
        LoginData result = userModelFromJson(jsonEncode(res.data)).data;
        saveData(result);
        return true;
      }
    }).catchError((e) {
      return ApiErrorHandel.errorHandel(context,e);
    });
  }


  //Profile Picture Update
  Future<bool> profilePictureUpdate(File file) async {
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
