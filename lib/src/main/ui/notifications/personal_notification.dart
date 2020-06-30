import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';

class PersonalNotification extends StatefulWidget {
  @override
  _PersonalNotificationState createState() => _PersonalNotificationState();
}

class _PersonalNotificationState extends State<PersonalNotification> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: TextWidget(title: 'Personal Notification',),),);
  }
}
