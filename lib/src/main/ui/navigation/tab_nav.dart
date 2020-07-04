import 'package:digitalkaimur/src/main/ui/navigation/tabs/home.dart';
import 'package:digitalkaimur/src/main/ui/navigation/tabs/news.dart';
import 'package:digitalkaimur/src/main/ui/navigation/tabs/notifications.dart';
import 'package:digitalkaimur/src/main/ui/navigation/tabs/profile.dart';
import 'package:digitalkaimur/src/main/ui/navigation/tabs/store.dart';
import 'package:digitalkaimur/src/main/ui/store/store_map.dart';
import 'package:digitalkaimur/src/main/ui/vender/get_location.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TabNavController extends StatefulWidget {
  @override
  _TabNavControllerState createState() => _TabNavControllerState();
}

class _TabNavControllerState extends State<TabNavController> {


  int _currentIndex = 0;
  final List<Widget> _children = [
    GetCurrentLocation(),
    MapStore(),
    News(),
    Notifications(),
    ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: TextWidget(fontSize:10,title:AppString.tabHome,isBold: true,),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            title: TextWidget(fontSize:10,title:AppString.tabStore,isBold: true),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation),
            title: TextWidget(fontSize:10,title:AppString.tabNews,isBold: true),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: TextWidget(fontSize:10,title:AppString.tabNotification,isBold: true),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: TextWidget(fontSize:10,title:AppString.tabProfile,isBold: true),
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
