

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


class Service{
    static Future<List<Datum>> getCategory() async{
      try {
        final response = await http.get(Config.getCategoryUrl);
        if (response.statusCode == 200) {
              return categoryModelFromJson(response.body).data;
        } else {
          return List<Datum>();
        }
      } on Exception catch (e) {
        return List<Datum>();
      }
    }
}