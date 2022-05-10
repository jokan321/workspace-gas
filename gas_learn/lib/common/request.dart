import 'package:dio/dio.dart';

class Request {
  static const String _basePath=
      "https://script.google.com/macros/s/AKfycbzZ65YAq6yRrOoXSafTLSDdJ--ajPJpa04dMvwKc2VlcVH9Q5SFl3M0TkJ18aS30wRI/exec";
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

  // 種類によって全ての内容を取得
  static Future getAllContent(int kind) async {
    var params = {
      "doFlag": 1,
      "kind": kind
    };
    Response response = await get(params);
    return response;
  }

  // キーワードによって内容を検索
  static Future getContentByKeyWord(int kind, String keyword) async {
    var params = {
      "doFlag": 2,
      "kind": kind,
      "keyWord": keyword
    };
    Response response = await get(params);
    return response;
  }

  // 内容を追加
  static Future addContent(int kind, String itemContents) async {
    var params = {
      "doFlag": 3,
      "kind": kind,
      "itemContents": itemContents
    };
    get(params);
  }

  // 内容を削除
  static Future deleteContent(int kind, int itemId) async {
    var params = {
      "doFlag": 4,
      "kind": kind,
      "itemId": itemId
    };
    get(params);
  }

  // 内容を編集
  static Future editContent(int kind, String itemContents,int itemId) async {
    var params = {
      "doFlag": 5,
      "kind": kind,
      "itemContents": itemContents,
      "itemId": itemId
    };
    get(params);
  }

}
