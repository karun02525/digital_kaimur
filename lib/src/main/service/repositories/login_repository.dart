import 'dart:convert';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/user_model.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import '../custom_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRespository {
  Future<LoginData> loginUser(String mobile, String password) {
    var params = {"mobile": mobile, "password": password};

    var dio = CustomDio().instance;
    return dio.post(Config.loginUrl, data: params).then((res) async {
      if (res.statusCode == 200) {
        LoginData result = userModelFromJson(jsonEncode(res.data)).data;
        saveData(result);
        return result;
      }
    }).catchError((e) {
      ApiErrorHandel.errorHandel(e);
    });
  }

  void saveData(LoginData res) async {
    var prefs = await SharedPreferences.getInstance();

    if (res.uid != null) {
      prefs.setString('uid', res.uid);
    }
    if (res.name != null) {
      prefs.setString('name', res.name);
    }
    if (res.email != null) {
      prefs.setString('email', res.email);
    }
    if (res.mobile != null) {
      prefs.setString('mobile', res.mobile);
    }
    if (res.gender != null) {
      prefs.setString('gender', res.gender);
    }
    if (res.userAvatar != null) {
      prefs.setString('user_avatar', res.userAvatar);
    }
    if (res.token != null) {
      prefs.setString('token', res.token);
    }
  }
}
