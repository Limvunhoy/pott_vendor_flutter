import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pott_vendor/core/api/logger_interceptor.dart';

class ApiBaseHelper {
  static final String baseUrl = "https://jsonplaceholder.typicode.com";
  static BaseOptions opts = BaseOptions(
      baseUrl: baseUrl,
      responseType: ResponseType.json,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {'Content-Type': 'application/json; charset=utf-8'});

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(LoggerInterceptor()
          // InterceptorsWrapper(
          //   onRequest: (options, handler) {
          //     return requestInterceptor(options);
          //   },
          //   onError: (DioError e, handler) async {
          //     return e.response!.data;
          //   }
          // )
          );
  }

  // static dynamic requestInterceptor(RequestOptions options) async {

  //   // Get your JWT token
  //   const token = ""; // this token should get from share preference
  //   options.headers.addAll({
  //     "Authorization": "Bearer: $token",
  //   });

  //   return options;
  // }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response> getHTTP(String url) async {
    try {
      Response response = await baseAPI.get(url);
      return response;
    } on DioError catch (e) {
      return _onHandleError(e);
    }
  }

  Future<Response> postHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } catch (e) {
      return _onHandleError(e);
    }
  }

  Future<Response> putHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.put(url, data: data);
      return response;
    } catch (e) {
      return _onHandleError(e);
    }
  }

  Future<Response> deleteHTTP(String url) async {
    try {
      Response response = await baseAPI.delete(url);
      return response;
    } catch (e) {
      return _onHandleError(e);
    }
  }

  dynamic _onHandleError(exp) {
    print(exp);
    if (exp.error is SocketException) {
      Fluttertoast.showToast(msg: "No Internet Connection");
    } else if (exp.error is TypeError) {
      throw exp.response.data;
    } else {
      print(exp.response.data);
      throw "Unexpected Error Occur!";
    }
  }
}
