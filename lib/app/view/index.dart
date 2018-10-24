import 'package:flutter/material.dart';

import 'package:flutter_app/app/item/joke_item.dart';
import 'package:flutter_app/app/model/joke.dart';


class IndexPage extends StatefulWidget {
    @override
    HomeState createState() => new HomeState();
}

class HomeState extends State<IndexPage> {
    List<JokeItem> _jokes = [];


    buildJokeItem(BuildContext context, int index) {
        JokeItem joke = _jokes[index];


        return new InkWell(
            onTap: () {
                showDialog(context: context, child: new AlertDialog(
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
        List<Widget> items = [];
        for (int i = 0; i < 3; ++i) {
            items.add(new JokeItem());
        }
        Widget index = new Container(
            color: Color(int.parse('dedede', radix: 16)),
            child: new ListView.builder(
                itemCount: _jokes.length,
                itemBuilder: buildJokeItem
            ),
        );


        return new Scaffold(
            appBar: new AppBar(
                elevation: 0.0,
                title: new Text('Index'),
            ),
            body: index
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
                    "nickname": '@cname',
                    "avatar": Random.image('50X50')
                },
                "joke": {
                    "content": Random.cparagraph(20, 100),
                    "image": Random.image('150X150')
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