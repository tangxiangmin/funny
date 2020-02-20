import 'dart:async';
import './base.dart';

// 获取笑话列表
Future loginByPassword() async {
  var response = await HttpUtil.dio.get('/login');
  return response;
}


Future fetchUserInfo() async {
  return await HttpUtil.dio.get('/userInfo');
}