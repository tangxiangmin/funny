import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

import 'package:flutter_app/app/model/joke.dart';
import 'package:flutter_app/app/view/detail.dart';
import 'package:flutter_app/app/item/joke_item.dart';

class JokeList extends StatefulWidget {
  JokeList({Key key}) : super(key: key);

  @override
  _JokeLitState createState() => _JokeLitState();
}

class _JokeLitState extends State<JokeList> {
  List<JokeModel> _jokes = [];

  Widget buildJokeItem(BuildContext context, int index) {
    JokeModel joke = _jokes[index];

    return new GestureDetector(
        onTap: () {
          int id = joke.id;
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new TextDetailPage(id)),
          );
        },
        child: new JokeItem(joke));
  }

  void getJobList() {
    http
        .get("http://45.40.194.188:7654/jokeList/")
        .then((http.Response response) {
      var res = response.body;
      setState(() {
        _jokes = JokeModel.fromJson(res);
      });
    });
  }
  @override
  void initState() {
    // 数据初始化函数
    super.initState();
    getJobList();
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
