import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/home_store_model.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';
import 'package:flutter/cupertino.dart';

class HomeStoreRepository {
  BuildContext context;
  HomeStoreRepository(BuildContext cnt) {
    this.context = cnt;
  }

  Future<List<StoreModel>> findAllStore() async {
    var dio = CustomDio.withAuthentication().instance;
    return await dio.get(Config.storeHome).then((res) {

      return HomeStoreModel.fromJson(res.data).data;
    }).catchError((e) {
       ApiErrorHandel.errorHandel(context, e);
    });
  }
}
