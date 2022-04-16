import 'package:dio/dio.dart';

class Request {
  static const String _basePath= "https://script.google.com/macros/s/AKfycbzZ65YAq6yRrOoXSafTLSDdJ--ajPJpa04dMvwKc2VlcVH9Q5SFl3M0TkJ18aS30wRI/exec";
  static final Request _request = Request._internal();
  factory Request() => _request;
  static late final Dio dio;
  Request._internal() {
    BaseOptions options = BaseOptions();
    dio = Dio(options);
  }

  Future<void> init ({
    String? baseUrl,
    int connectTimeout = 5000,
    int receiveTimeout = 3000,
    Map<String, String>? headers,
    List<Interceptor>? interceptors,}) async {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers ?? const {},
    );
  }

  static Future get(Map<String, dynamic>? params) async {
    Response response;
    response = await dio.get(_basePath, queryParameters: params);
    return response;
  }

  //所有内容获得
  static Future getAllContent(int kind) async {
    var params = {
      "doFlag": 1,
      "kind": kind
    };
    Response response = await get(params);
    return response;
  }

}
