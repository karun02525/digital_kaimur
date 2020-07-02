import 'dart:convert';
import 'package:digitalkaimur/src/main/ui/authentication/login_screen.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

class ApiErrorHandel{


  static bool errorHandel(context,e){
    dynamic errorMessage="";
    try {
      errorMessage = jsonDecode(jsonEncode(e.response.data));
    } catch (e) {
      Global.toast('Something went wrong');
      return false;
    }
    var statusCode = e.response.statusCode;
    if (statusCode == 400) {
      Global.toast(errorMessage['message']);
      return false;
    } else if (statusCode == 401) {
    //  Global.toast(errorMessage['message']);
      _handleSignOut(context);
      return false;
    } else if (statusCode == 403) {
      Global.toast(errorMessage['message']);
      return false;
    } else if (statusCode == 404) {
      Global.toast(errorMessage['message']);
      return false;
    } else if (statusCode == 500) {
      Global.toast('Something went wrong please try again!!');
      return false;
    }else {
      Global.toast('Something went wrong');
      return false;
    }
  }

  static void _handleSignOut(context) {
    UserPreference().clearSharedPreferences().then((value){
      if(value){
        Global.toast(context.toString());
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) => LoginScreen()
            )
        );
      }
    });
  }

}