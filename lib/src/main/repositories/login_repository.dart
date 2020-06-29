import 'dart:convert';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/user_model.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';


class LoginRespository {
  Future<bool> loginUser(String mobile, String password) {
    var params = {"mobile": mobile, "password": password};
    var dio = CustomDio.withAuthentication().instance;
    return dio.post(Config.loginUrl, data: params).then((res) async {
      if (res.statusCode == 200) {
        LoginData result = userModelFromJson(jsonEncode(res.data)).data;
        saveData(result);
        return true;
      }
    }).catchError((e) {
      ApiErrorHandel.errorHandel(e);
      return false;
    });
  }

  //Register
  Future<bool> registerUser(name, mob, email, pass, gender) {
    var params = {
      "name": name,
      "mobile": mob,
      "email": email,
      "password": pass,
      "gender": gender
    };

    var dio =CustomDio.withAuthentication().instance;
    return dio.post(Config.registerUrl, data: params).then((res) async {
      if (res.statusCode == 201) {
        LoginData result = userModelFromJson(jsonEncode(res.data)).data;
        saveData(result);
        return true;
      }
    }).catchError((e) {
      ApiErrorHandel.errorHandel(e);
      return false;
    });
  }

  void saveData(LoginData res) async {
    var pref = UserPreference();
    pref.name = res.name;
    pref.email = res.email;
    pref.name = res.name;
    pref.token = res.token;
    pref.avatar = res.userAvatar;
    pref.isLogin = true;
  }
}
