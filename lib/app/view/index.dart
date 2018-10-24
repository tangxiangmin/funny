import 'package:flutter/material.dart';

import 'package:flutter_app/app/item/joke_item.dart';
import 'package:flutter_app/app/model/joke.dart';


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
                showDialog(context: context,
                    child: new AlertDialog(
                        content: new Text(
                            "尽情期待!",
                            style: new TextStyle(fontSize: 20.0),
                        )));
            },
            child: new JokeItem(joke)
        );
    }

    @override
    void initState() {
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

    void getJobList() {
        setState(() {
            _jokes = JokeModel.fromJson("""
          {
            "data": [
              {
                "id": 10000,
                "author": {
                    "uid": 9912,
                    "nickname": "@cname",
                    "avatar": "http://dummyimage.com/200x200/FF6600"
                },
                "joke": {
                    "content": "xxx",
                    "image": "http://dummyimage.com/200x200/FF6600"
                },
                "likeNum": 1,
                "dislikeNum": 12,
                "commentNum": 1
              },
              {
                "id": 1100,
                "author": {
                    "uid": 9912,
                    "nickname": "@cname",
                    "avatar": "http://dummyimage.com/200x200/FF6600"
                },
                "joke": {
                    "content": "xxx",
                    "image": "http://dummyimage.com/200x200/FF6600"
                },
                "likeNum": 1,
                "dislikeNum": 12,
                "commentNum": 1
              }
            ]
          }
      """);
        });
    }
}