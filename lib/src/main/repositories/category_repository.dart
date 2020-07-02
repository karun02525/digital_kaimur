import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';
import 'package:flutter/cupertino.dart';

class CategoryRepository{

  BuildContext context;
  CategoryRepository(BuildContext cnt){
    this.context=cnt;
  }

  Future<List<DataList>> findAllCategory() async {
      var dio =CustomDio.withAuthentication().instance;
     return await dio.get(Config.getCategoryUrl).then((res){
        return CategoryModel.fromJson(res.data).data;
      }).catchError((e) {
       return ApiErrorHandel.errorHandel(context,e);
     });
  }
}