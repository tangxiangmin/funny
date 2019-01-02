
import './base.dart';


class AuthApi {
  static Future login() async{
    return HttpUtil.dio.get("/login");
  }
}