import 'package:digitalkaimur/src/main/ui/navigation/tab_nav.dart';
import 'package:digitalkaimur/src/main/ui/product/global_search.dart';
import 'file:///D:/project/flutter_project/flutter_app/Digital_Kaimur/digital_kaimur/lib/src/main/ui/navigation/tabs/profile.dart';
import 'package:digitalkaimur/src/res/colors.dart';
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
      routes: {
        '/home':(context) => TabNavController(),
        '/search':(context) => GlobalSearch()
      },
    );
  }
}