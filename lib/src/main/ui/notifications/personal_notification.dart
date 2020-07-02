import 'package:digitalkaimur/src/main/model/notification_model.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalNotification extends StatefulWidget {
  List<NotificationData> data=[];
  PersonalNotification({Key key, this.data}) : super(key: key);

  @override
  _PersonalNotificationState createState() => _PersonalNotificationState();
}

class _PersonalNotificationState extends State<PersonalNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget.data.length == 0
            ? Container(
                child: Center(child: TextWidget(title: 'Noting Notifications')))
            : ListView.builder(
             reverse: true,
             itemCount: widget.data.length,
            itemBuilder: (context, index) {
                return buildCard(widget.data[index]);
              }));
  }

  Widget buildCard(NotificationData data) {
    return Card(
        child: ListTile(
        title: TextWidget(title:data.title),
          subtitle:TextWidget(title:data.message,fontSize: 12.0),
          trailing:TextWidget(title:Global.timeAgo(data.createAt),isBold: true,fontSize: 11.0,) ,
    ));
  }


}
