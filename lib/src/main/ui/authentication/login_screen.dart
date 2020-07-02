import 'package:digitalkaimur/src/main/repositories/login_repository.dart';
import 'package:digitalkaimur/src/main/ui/authentication/registration_screen.dart';
import 'package:digitalkaimur/src/main/ui/routes/slide_from_right_page_route.dart';
import 'package:digitalkaimur/src/main/ui/widgets/button_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/textfield_widget.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _editMobile = TextEditingController();
  var _editPassword = TextEditingController();
  bool isLoading = false;
  LoginRespository _repository;

  @override
  void initState() {
    super.initState();
    _repository = LoginRespository(context);
  }

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
        Global.hideKeyboard();
        isLoading = true;
      });

      _repository.loginUser(mob, pass).then((value) {
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
    return Scaffold(body: loginWidget());
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
                child: CupertinoActivityIndicator(radius: 15.0)),
            ButtonWidget(
              title: 'Login',
              onPressed: doLogin,
              color: Colors.blue,
            ),
            ButtonWidget(
              title: 'Register',
              onPressed: () {
                goToRegister(context);
              },
              color: Colors.blue,
            )
          ],
        ),
      )),
    );
  }


void goToRegister(BuildContext context) {
  Navigator.push(context, SlideFromRightPageRoute(
      widget: RegisterScreen()
  ));
}
}
