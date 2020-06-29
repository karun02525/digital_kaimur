import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/service/api_error_handle.dart';
import 'package:digitalkaimur/src/main/service/custom_dio.dart';

class CategoryRepository{
  Future<List<DataList>> findAllCategory() {
      var dio =CustomDio.withAuthentication().instance;
     return dio.get(Config.getCategoryUrl).then((res){
        return CategoryModel.fromJson(res.data).data;
      }).catchError((e) {
       ApiErrorHandel.errorHandel(e);
       return false;
     });
  }
}