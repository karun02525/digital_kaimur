import 'package:digitalkaimur/src/main/repositories/login_repository.dart';
import 'package:digitalkaimur/src/main/ui/widgets/button_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/textfield_widget.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _editName = TextEditingController();
  var _editMobile = TextEditingController();
  var _editEmail = TextEditingController();
  var _editPassword = TextEditingController();
  bool isLoading = false;
  LoginRespository _repository;

  @override
  void initState() {
    super.initState();
    _repository = LoginRespository();
  }

  void doRegister() {
    var name = _editName.text.toString();
    var mob = _editMobile.text.toString();
    var email = _editEmail.text.toString();
    var pass = _editPassword.text.toString();
    if (name.isEmpty) {
      Global.toast("Please enter mobile");
    } else if (mob.isEmpty) {
      Global.toast("Please enter mobile");
    } else if (mob.length != 10) {
      Global.toast("Please enter valid mobile");
    } else if (email.isEmpty) {
      Global.toast("Please enter password");
    } else if (pass.isEmpty) {
      Global.toast("Please enter password");
    } else if (pass.length < 7) {
      Global.toast("Please enter valid password should be more than 8 chars");
    } else {
      setState(() {
        Global.hideKeyboard();
        isLoading = true;
      });
      _repository.registerUser(name, mob, email, pass, "Male").then((value) {
        setState(() {
          isLoading = false;
          if (value) {
            Global.navigateToHome(context);
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async {
          moveToLogin();
         return true;
        },
        child: Scaffold(body: loginWidget()));
  }

  Widget loginWidget() {
    return Center(
      child: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
              TextWidget(
              title: "DIGITAL KAIMUR",
              isBold: true,
              fontSize: 25.0,
            ),
            TextWidget(
              title: "Register here",
              isBold: true,
              fontSize: 14.0,
            ),
            SizedBox(height: 10.0),
            TextFieldWidget(
                hintText: "Enter full name",
                controller: _editName,
                letterSpacing: 1.0,
                keyboardType: TextInputType.text,
                minLine: 1),
            SizedBox(height: 5.0),
            TextFieldWidget(
                hintText: "Enter Mobile Number",
                controller: _editMobile,
                maxLength: 10,
                letterSpacing: 2.0,
                color: Colors.white,
                keyboardType: TextInputType.number),
            SizedBox(height: 5.0),
            TextFieldWidget(
                hintText: "Enter email id",
                controller: _editEmail,
                letterSpacing: 1.0,
                minLine: 1,
                keyboardType: TextInputType.emailAddress),
            SizedBox(height: 5.0),
            TextFieldWidget(
                hintText: "Enter Password",
                controller: _editPassword,
                letterSpacing: 1.0,
                minLine: 1,
                obscureText: true),
            Visibility(
                visible: isLoading,
                child: CupertinoActivityIndicator(radius: 15.0)),
            ButtonWidget(
              title: 'Register',
              onPressed: doRegister,
              color: Colors.blue,
            ),
            ButtonWidget(
              title: 'Login',
              onPressed:(){moveToLogin();},
              color: Colors.blue,
            )
          ],
        ),
      )),
    );
  }

  void moveToLogin() {
    Navigator.pop(context);
  }
}
