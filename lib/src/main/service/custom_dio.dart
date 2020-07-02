import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDio{
  var _dio;
  CustomDio(){
    _dio=Dio();
  }

  CustomDio.withAuthentication(){
    _dio=Dio();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest:_onRequest,onResponse:_onResponse,onError: _onError
    ));
  }

  Dio get instance=>_dio;

  _onRequest(RequestOptions options) async {
    print('*************************@@**********************************');
    print('send request：path:  ${options.path}');
    print('');
    print('contentType:${options.queryParameters}');
    print('_________________________________________________________________');
    print('JWT: Token:  '+UserPreference().token);
    print('*************************@@@@*******************************');

    options.headers['authorization']='Bearer '+UserPreference().token;
  }

  _onResponse(Response e) {
     print(e.data);
     print('----------------------------------'+e.statusCode.toString());

  }

  _onError(DioError e) {
    print('_________________________________________________________________');
    print('---------------'+e.response.statusCode.toString());
    return e;
  }
}