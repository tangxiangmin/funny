import 'package:flutter/material.dart';

import 'package:flutter_app/app/item/joke_item.dart';
import 'package:flutter_app/app/model/joke.dart';
import 'package:flutter_app/app/view/detail.dart';

import 'package:http/http.dart' as http;

class IndexPage extends StatefulWidget {
    @override
    HomeState createState() => new HomeState();
}

class HomeState extends State<IndexPage> {
    List<JokeModel> _jokes = [];


    Widget buildJokeItem(BuildContext context, int index) {
        JokeModel joke = _jokes[index];

        return new GestureDetector(
            onTap: () {
                int id = joke.id;
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new TextDetailPage(id)),
                );
//                showDialog(context: context,
//                    child: new AlertDialog(
//                        content: new Text(
//                            "敬请期待!",
//                            style: new TextStyle(fontSize: 20.0),
//                        )));
            },
            child: new JokeItem(joke)
        );
    }

    void getJobList() {
        setState(() {
            http.get("http://45.40.194.188:7654/jokeList/")
                .then((http.Response response) {
                var res = response.body;
                setState(() {
                    _jokes = JokeModel.fromJson(res);
                });
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
        return new Scaffold(
            appBar: new AppBar(
                elevation: 0.0,
                title: new Text('Index'),
            ),
            body: new Container(
                color: Color(int.parse('dedede', radix: 16)),
                child: new ListView.builder(
                    itemCount: _jokes.length,
                    itemBuilder: buildJokeItem
                ),
            )
        );
    }

}