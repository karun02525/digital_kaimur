import 'dart:async';
import 'package:digitalkaimur/src/main/ui/authentication/login_screen.dart';
import 'package:digitalkaimur/src/main/ui/navigation/tab_nav.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;
  @override
  void initState() {
    isLogin = UserPreference().isLogin ?? false;
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => isLogin
            ? Global.navigateToHome(context)
            : Global.navigateToLogin(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color(0xffE25819),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(top: 260.0, left: 35.0, right: 20),
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.yellow,
            child: Text("PopWoot",
                style: TextStyle(
                    fontSize: 70.0,
                    decoration: TextDecoration.none,
                    shadows: <Shadow>[
                      Shadow(
                          blurRadius: 10.0,
                          color: Colors.white,
                          offset: Offset.fromDirection(100, 3))
                    ])),
          ),
        ),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.cyan, Colors.purpleAccent])),
      ),
    );
  }
}
