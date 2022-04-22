import 'package:dio/dio.dart';

// todo 这里增加一些基础请求信息
Options opt = Options(
    baseUrl: "http://172.21.20.23:7999/",
    connectTimeout: 5000,
    receiveTimeout: 3000);

Dio singleton = Dio(opt);

class HttpUtil {
  static Dio dio = singleton;
}
