import 'dart:convert';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/model/verify_model.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';
import 'package:flutter/cupertino.dart';

class CategoryRepository {
  BuildContext context;
  CategoryRepository(BuildContext cnt) {
    this.context = cnt;
  }

  Future<List<DataList>> findAllCategory() async {
    var dio = CustomDio.withAuthentication().instance;
    return await dio.get(Config.getCategoryUrl).then((res) {
      return CategoryModel.fromJson(res.data).data;
    }).catchError((e) {
       ApiErrorHandel.errorHandel(context, e);
    });
  }

  //Verify vendor...........

  Future<DataModel> vendorVerify() async {
    var dio = CustomDio.withAuthentication().instance;
    return await dio.get(Config.vendor_verifyUrl).then((res) {
      if (res.statusCode == 200) {
        return verifyModelFromJson(jsonEncode(res.data)).data;
      }
    }).catchError((e) {
      ApiErrorHandel.errorHandel(context, e);
    });
  }

  Future<DataModel> vendorRegister(String cid) async {
    var dio = CustomDio.withAuthentication().instance;
    return await dio.get('${Config.vendor_registerUrl}/$cid').then((res) {
      if (res.statusCode == 200) {
        return verifyModelFromJson(jsonEncode(res.data)).data;
      }
    }).catchError((e) {
      ApiErrorHandel.errorHandel(context, e);
    });
  }
}
