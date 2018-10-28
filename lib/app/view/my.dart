import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
    @override
    MyState createState() => new MyState();
}

class MyState extends State<MyPage> {
    @override
    Widget build(BuildContext context) {
        Widget createListItem(icon, text) {
            return new Container(
                margin: EdgeInsets.only(bottom: 10.0),
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        new Row(children: <Widget>[
                            new Icon(icon),
                            new Text(text),
                        ],),
                        new Icon(Icons.arrow_forward_ios)
                    ],
                ),);
        }

        Widget my = new Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(bottom: 20.0),
            child: new ListView(
                children: <Widget>[
                    new Container(child: new Row(children: <Widget>[
                        new Image.network(
                            'http://dummyimage.com/200x200/FF6600',
                            height: 100.0,
                            fit: BoxFit.cover,
                        ),
                        new Column(
                            children: <Widget>[
                                new Text('登录/注册',
                                    textAlign: TextAlign.left,
                                ),
                                new Text('欢迎您', textAlign: TextAlign.left,)
                            ],
                        ),
                        new Icon(Icons.arrow_forward_ios)
                    ],),),
                    new Container(
                        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        padding: const EdgeInsets.only(bottom: 10.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.grey),
                            ),
                        ),
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                                new Column(
                                    children: <Widget>[
                                        new Text('0'),
                                        new Text('获赞')
                                    ],
                                ),
                                new Column(
                                    children: <Widget>[
                                        new Text('0'),
                                        new Text('粉丝')
                                    ],
                                ),
                                new Column(
                                    children: <Widget>[
                                        new Text('0'),
                                        new Text('关注')
                                    ],
                                )
                            ],),
                    ),

                    createListItem(Icons.event_note, '帖子'),
                    createListItem(Icons.comment, '评论'),
                    createListItem(Icons.collections, '收藏'),
                    createListItem(Icons.timeline, '观看历史'),
                    createListItem(Icons.terrain, '意见反馈'),

                ]
            ),);

        return new Scaffold(
            appBar: new AppBar(
                elevation: 0.0,
                title: new Text('个人中心'),
            ),
            body: my
        );
    }
}
