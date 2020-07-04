import 'package:digitalkaimur/learn/demo_redirect_link.dart';
import 'package:digitalkaimur/src/main/ui/notifications/general_notification.dart';
import 'package:digitalkaimur/src/main/ui/notifications/personal_notification.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/res/fonts.dart';
import 'package:digitalkaimur/src/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 2.0,
        centerTitle: true,
        title: TextWidget(title:AppString.tabNews, fontSize: AppFonts.toolbarSize,isBold: true),
      ),
      body:ProfileScreen() ,
    );

  }

  Widget tab() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: TabBar(
                unselectedLabelColor: Colors.redAccent,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
                tabs: [
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Colors.redAccent, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextWidget(
                          title: "General",
                          isBold: true,
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: Colors.redAccent, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextWidget(
                          title: "Personal",
                          isBold: true,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          body: TabBarView(children: [
            GeneralNotification(),
            PersonalNotification(),
          ]),
        ),
      ),
    );
  }
}
