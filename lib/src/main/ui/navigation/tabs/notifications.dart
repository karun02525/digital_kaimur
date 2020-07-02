import 'package:digitalkaimur/src/main/model/notification_model.dart';
import 'package:digitalkaimur/src/main/repositories/notification_repository.dart';
import 'package:digitalkaimur/src/main/ui/notifications/general_notification.dart';
import 'package:digitalkaimur/src/main/ui/notifications/personal_notification.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/res/fonts.dart';
import 'package:digitalkaimur/src/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  List<NotificationData> notificationList;
  NotificationRepository _repository;
  bool _isLoading=true;
  @override
  void initState() {
    super.initState();
    _repository = NotificationRepository(context);
    fetchCategory();
  }

  void fetchCategory(){
    _repository.findAllNotifications().then((value){
      setState(() {
        _isLoading = false;
        notificationList=value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 2.0,
        centerTitle: true,
        title: TextWidget(title:AppString.tabNotification, fontSize: AppFonts.toolbarSize,isBold: true),
      ),
      body:tab() ,
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
          body:_isLoading?Container(child: Center(child: CircularProgressIndicator())):
          TabBarView(children: [
            GeneralNotification(),
            PersonalNotification(data:notificationList),
          ]),
        ),
      ),
    );
  }
}
