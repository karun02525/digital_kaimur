import 'dart:convert';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';

class CategoryRepository{
  Future<List<Datum>> findAllCategory() {
      var dio =CustomDio.withAuthentication().instance;
     return dio.get(Config.getCategoryUrl).then((res){
        return CategoryModel.fromJson(res.data).data;
      });
  }
}