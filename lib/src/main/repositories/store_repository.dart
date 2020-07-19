import 'dart:convert';
import 'dart:io';
import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class StoreRespository {
  BuildContext context;
  ProgressDialog pd;

  StoreRespository(BuildContext cnt) {
    this.context = cnt;
    pd = ProgressDialog(this.context, type: ProgressDialogType.Normal);
    pd.style(message: 'Loading...');
  }

  //Store Register
  Future<bool> storeRegister(List<File> files, element) async {
    pd.show();
    var dio = CustomDio.withAuthentication().instance;
    dio.options.headers["Content-Type"] = "multipart/form-data";

    var formData = FormData();
    for (var i = 0; i < files.length; i++) {
      formData.files.add(MapEntry("imgarray",
          await MultipartFile.fromFile(files[i].path, filename: "pic$i.png")));
    }

    formData.fields.add(MapEntry("cid", element[0]));
    formData.fields.add(MapEntry("vid", element[1]));
    formData.fields.add(MapEntry("sname", element[2]));
    formData.fields.add(MapEntry("semail", element[3]));
    formData.fields.add(MapEntry("smobile", element[4]));
    formData.fields.add(MapEntry("color", element[5]));
    formData.fields.add(MapEntry("latitude", element[6].toString()));
    formData.fields.add(MapEntry("longitude", element[7].toString()));
    formData.fields.add(MapEntry("address", element[8]));
    formData.fields.add(MapEntry("nearby", element[9]));
    formData.fields.add(MapEntry("pin_code", element[10]));
    formData.fields.add(MapEntry("owner_name", element[11]));
    formData.fields.add(MapEntry("owner_mobile", element[12]));
    formData.fields.add(MapEntry("owner_email", element[13]));

    return await dio.post(Config.storeCreate, data: formData).then((res) async {
      if (res.statusCode == 200) {
        pd.hide();
        var result = jsonDecode(jsonEncode(res.data));
        if (result['status']) {
          messageAlert(context, result['message'], 'Add Store');
          return true;
        }
      }
    }).catchError((e) {
      pd.hide();
      return ApiErrorHandel.errorHandel(context, e);
    });
  }

  messageAlert(context, String msg, String ttl) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: CupertinoAlertDialog(
                title: Text(ttl),
                content: Text(msg),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Column(
                      children: <Widget>[Text('Okay')],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
        });
  }
}
