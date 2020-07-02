import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/notification_model.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';
import 'package:flutter/cupertino.dart';

class NotificationRepository{

  BuildContext context;
  NotificationRepository(BuildContext cnt){
    this.context=cnt;
  }

  Future<List<NotificationData>> findAllNotifications() async {
      var dio =CustomDio.withAuthentication().instance;
     return await dio.get(Config.notificationsUrl).then((res){
        return NotificationModel.fromJson(res.data).data;
      }).catchError((e) {
       return ApiErrorHandel.errorHandel(context,e);
     });
  }
}