import 'dart:convert';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/user_model.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';


class LoginRespository {
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
      return ApiErrorHandel.errorHandel(e);
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
      ApiErrorHandel.errorHandel(e);
      return ApiErrorHandel.errorHandel(e);
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
