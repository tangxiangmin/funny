import "package:flutter/material.dart";

// import 'package:flutter_app/app/model/joke.dart';
import 'package:flutter_app/app/view/detail.dart';
import 'package:flutter_app/app/item/jokeItem.dart';

import 'package:dio/dio.dart';
import 'package:flutter_app/app/model/joke_list.dart' as JokeListModel;

class JokeList extends StatefulWidget {
  JokeList({Key key}) : super(key: key);

  @override
  _JokeLitState createState() => _JokeLitState();
}

class _JokeLitState extends State<JokeList> {
  List<JokeListModel.Data> _jokes = [];

  Widget buildJokeItem(BuildContext context, int index) {
    JokeListModel.Data joke = _jokes[index];

    return new GestureDetector(
        onTap: () {
          int id = joke.id;
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new TextDetailPage(id)),
          );
        },
        child: JokeItem(joke: joke));
  }

  void getJokeList() async {
    Dio dio = new Dio();

    var response = await dio.get("http://192.168.0.7:7999/jokeList/");

    JokeListModel.joke_list res =
        JokeListModel.joke_list.fromJson(response.data);

    if (res.code == 0) {
      setState(() {
        _jokes = res.data;
      });
    }
  }

  @override
  void initState() {
    // 数据初始化函数
    super.initState();
    getJokeList();
  }

  @override
  void reassemble() {
    super.reassemble();
    getJokeList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(int.parse('dedede', radix: 16)),
      child: new ListView.builder(
          itemCount: _jokes.length, itemBuilder: buildJokeItem),
    );
  }
}
