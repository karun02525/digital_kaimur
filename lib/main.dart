
import 'dart:io' show Platform;
import 'package:digitalkaimur/src/main/ui/authentication/login_screen.dart';
import 'package:digitalkaimur/src/main/ui/authentication/registration_screen.dart';
import 'package:digitalkaimur/src/main/ui/authentication/splash_screen.dart';
import 'package:digitalkaimur/src/main/ui/navigation/tab_nav.dart';
import 'package:digitalkaimur/src/main/ui/product/global_search.dart';
import 'package:digitalkaimur/src/main/ui/vender/register_store.dart';
import 'package:digitalkaimur/src/main/ui/widgets/registration_form_widget.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:digitalkaimur/src/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/generated/i18n.dart' as location_picker;
import 'package:flutter_localizations/flutter_localizations.dart';



void main() {

 /* if (Platform.isAndroid) {
    // Android-specific code
  } else if (Platform.isIOS) {
    // iOS-specific code
  }else{
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
*/
  runApp(LaunchApp());
}

class LaunchApp extends StatefulWidget {
  @override
  _LaunchAppState createState() => _LaunchAppState();
}

class _LaunchAppState extends State<LaunchApp> {

  @override
  void initState(){
    super.initState();
    m();
  }

  void m()async{
    WidgetsFlutterBinding.ensureInitialized();
    await UserPreference().init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //For map
      localizationsDelegates: const [
        location_picker.S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('hi', ''),
      ],


      theme:
          ThemeData(primaryColor: AppColor.appColor, accentColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: TabNavController(),
      routes: {
        '/home': (context) => TabNavController(),
        '/search': (context) => GlobalSearch()
      },
    );
  }
}
