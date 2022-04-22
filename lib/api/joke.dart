import 'dart:async';
import 'base.dart';

// 获取笑话列表
Future fetchJokeList() async {
  var response = await HttpUtil.dio.get('/jokeList');
  return response;
}
