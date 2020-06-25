import 'dart:convert';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/user_model.dart';
import 'package:digitalkaimur/src/main/ui/widgets/button_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/textfield_widget.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Future<UserModel> loginUser(String mobile, String password) async {
  var params = {"mobile": mobile, "password": password};
  final response = await Dio().post(Config.loginUrl, data: params);

  debugPrint("User Data Login params: " + params.toString());
  debugPrint("User Data Login loginUrl: " + Config.loginUrl.toString());


  if (response.statusCode == 200) {
    return userModelFromJson(response.data);
  } else {
    return null;
  }
}

class _LoginScreenState extends State<LoginScreen> {
  var _editMobile = TextEditingController();
  var _editPassword = TextEditingController();
  bool isLoading = false;

  void doLogin() {
    var mob = _editMobile.text.toString();
    var pass = _editPassword.text.toString();
    if (mob.isEmpty) {
      Global.toast("Please enter mobile");
    } else if (mob.length != 10) {
      Global.toast("Please enter valid mobile");
    } else if (pass.isEmpty) {
      Global.toast("Please enter password");
    } else if (pass.length < 7) {
      Global.toast("Please enter valid password should be more than 8 chars");
    } else {
      setState(() {
        isLoading = true;
      });
      doLoginFromApi(mob, pass);
    }
  }

  void doLoginFromApi(String mobile, String password) async {
    final UserModel user = await loginUser(mobile,password);
    debugPrint("User Data Login Model: "+ user.data.toString());
    if(user==null) {
      hideLoader();
    }else{
      hideLoader();
    }



  /*  try {
      var params = {"mobile": mobile, "password": password};
      final response = await Dio().post(Config.loginUrl, data: params);

      debugPrint("User Data Login params: " + params.toString());
      debugPrint("User Data Login loginUrl: " + Config.loginUrl.toString());

      if (response.statusCode == 200) {
        hideLoader();
        final responseBody = jsonDecode(jsonEncode(response.data));
        debugPrint("User Data Login: " + responseBody.toString());
      }
    } on DioError catch (e) {
      var errorMessage = jsonDecode(jsonEncode(e.response.data));
      var statusCode = e.response.statusCode;
      if (statusCode == 400) {
        hideLoader();
        Global.toast(errorMessage['message']);
      } else if (statusCode == 401) {
        hideLoader();
        Global.toast(errorMessage['message']);
      } else if (statusCode == 404) {
        hideLoader();
        Global.toast(errorMessage['message']);
      } else {
        hideLoader();
        Global.toast('Something went wrong');
      }
    }*/
  }

  void hideLoader(){
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginWidget()
    );
  }

  Widget loginWidget() {
    return Center(
      child: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(left:40.0,right: 40.0),
        child: Wrap(
          alignment:WrapAlignment.center,
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            TextWidget(
              title: "DIGITAL KAIMUR",
              isBold: true,
              fontSize: 25.0,
            ),
            TextWidget(
              title: "Login to continue",
              isBold: true,
              fontSize: 14.0,
            ),
            SizedBox(height: 40.0),
            TextFieldWidget(
                hintText: "Enter Mobile Number",
                controller: _editMobile,
                maxLength: 10,
                letterSpacing: 2.0,
                color: Colors.white,
                keyboardType: TextInputType.number),
            SizedBox(height: 5.0),
            TextFieldWidget(
                hintText: "Enter Password",
                controller: _editPassword,
                letterSpacing: 1.0,
                minLine: 1,
                obscureText: true),

           Visibility(
              visible: isLoading,
             child:  CupertinoActivityIndicator(radius: 15.0)),


            ButtonWidget(
              title: 'Login',
              onPressed: doLogin,
              color: Colors.blue,
            )
          ],
        ),
      )),
    );
  }
}
