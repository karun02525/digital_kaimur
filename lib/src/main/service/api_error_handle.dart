
import 'dart:convert';

import 'package:digitalkaimur/src/main/utils/global.dart';

class ApiErrorHandel{

 static bool errorHandel(e){
    var errorMessage = jsonDecode(jsonEncode(e.response.data));
    var statusCode = e.response.statusCode;
    if (statusCode == 400) {
      Global.toast(errorMessage['message']);
      return false;
    } else if (statusCode == 401) {
      Global.toast(errorMessage['message']);
      return false;
    } else if (statusCode == 404) {
      Global.toast(errorMessage['message']);
      return false;
    } else if (statusCode == 422) {
      Global.toast(errorMessage['message']);
      return false;
    } else {
      Global.toast('Something went wrong');
      return false;
    }
  }

}