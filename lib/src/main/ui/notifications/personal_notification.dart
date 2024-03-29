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
    List<NotificationData> data=List.from(widget.data.reversed);
    return Container(
        child: data.length == 0
            ? Container(
                child: Center(child: TextWidget(title: 'Noting Notifications')))
            : ListView.builder(
             itemCount: data.length,
            itemBuilder: (context, index) {
                return buildCard(data[index]);
              }));
  }

  Widget buildCard(NotificationData data) {
    return Card(
        child: ListTile(
        title:contentWidget(data.title??'',data.category??'----'),
          subtitle:TextWidget(title:data.message,fontSize: 12.0),
          trailing:TextWidget(title:Global.timeAgo(data.createAt),isBold: true,fontSize: 11.0,) ,
    ));
  }


  Widget contentWidget(title,cat){
     return Container(
         child:Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(title:title),
            TextWidget(title:cat),
          ],
         ),
     );
  }

}
