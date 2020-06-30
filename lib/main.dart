import 'package:digitalkaimur/src/main/ui/authentication/login_screen.dart';
import 'package:digitalkaimur/src/main/ui/authentication/registration_screen.dart';
import 'package:digitalkaimur/src/main/ui/authentication/splash_screen.dart';
import 'package:digitalkaimur/src/main/ui/navigation/tab_nav.dart';
import 'package:digitalkaimur/src/main/ui/product/global_search.dart';
import 'package:digitalkaimur/src/main/ui/vender/register_store.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:digitalkaimur/src/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreference().init();
  runApp(LaunchApp());
}

class LaunchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primaryColor: AppColor.appColor, accentColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/home': (context) => TabNavController(),
        '/search': (context) => GlobalSearch(),
        '/register-store': (context) => RegisterStore()
      },
    );
  }
}
