import 'package:digitalkaimur/res/colors.dart';
import 'file:///D:/project/flutter_project/flutter_app/Digital_Kaimur/digital_kaimur/lib/src/navigation/tab_nav_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(LaunchPage());

class LaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          theme: ThemeData(
              primaryColor: AppColor.appColor, accentColor: Colors.blue),
                debugShowCheckedModeBanner: false,
           home:TabNavController() ,
    );
  }
}