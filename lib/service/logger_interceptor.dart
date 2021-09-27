import 'package:flutter/material.dart';

class LoggerInterceptor extends Interceptor {
  LoggerInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logPrint("*** REQUEST LOG ***");
    printKV("URL", options.uri);
    printKV("METHOD", options.method);
    logPrint("HEADERS:");
    options.headers.forEach((key, value) => printKV("-$key", value));
    logPrint("BODY:");
    printAll(options.data ?? "");
    logPrint("*** END LOG ***");
    // return requestInterceptor(options);
    requestInterceptor(options);
    return super.onRequest(options, handler);
  }

  static dynamic requestInterceptor(RequestOptions options) async {
    // Get your JWT token
    const token = ""; // this token should get from share preference
    options.headers.addAll({
      "Authorization": "Bearer: $token",
    });

    return options;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logPrint("*** RESPONSE LOG ***");
    printKV("URL", response.realUri);
    printKV("STATUS CODE", response.statusCode);
    logPrint("BODY:");
    printAll(response.data);
    logPrint("*** END LOG ***");

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logPrint("*** ERROR LOG ***");
    printKV("URL:", err.requestOptions.uri);
    printKV("STATUS CODE:", err.response!.statusCode.toString());
    logPrint("$err");
    if (err.response != null) {
      logPrint("BODY:");
      printAll(err.message.toString());
    }
    logPrint("*** END LOG");
    return super.onError(err, handler);
  }

  void printAll(msg) {
    msg.toString().split("\n").forEach(logPrint);
  }

  void printKV(String key, dynamic v) {
    logPrint("$key: $v");
  }

  void logPrint(String s) {
    debugPrint(s);
  }
}
