import 'package:digitalkaimur/res/strings.dart';
import 'package:digitalkaimur/widgets/nav_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tabs/home.dart';

class TabNavController extends StatefulWidget {
  @override
  _TabNavControllerState createState() => _TabNavControllerState();
}

class _TabNavControllerState extends State<TabNavController> {


  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Container(color: Colors.red,),
    Container(color: Colors.green,),
    Container(color: Colors.blue,),
    Container(color: Colors.orange,),
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
            title: TextWidget(AppString.tabHome),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            title: TextWidget(AppString.tabStore),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation),
            title: TextWidget(AppString.tabNews),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: TextWidget(AppString.tabNotification),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: TextWidget(AppString.tabProfile),
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
