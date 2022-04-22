import 'package:flutter/material.dart';


import 'package:flutter_app/components/jokeList.dart';

class CollectionPage extends StatelessWidget {
  CollectionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget page = Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset(
                "assets/banner/shadiao.gif",
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("保护我方沙雕", style: TextStyle(fontSize: 30)),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.red,
                    child: Text("关注", style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "9万人看过",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Text("想要我的宝藏吗？\n如果想要的话，那就去大海寻找吧，我把一切都放在那里了",
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
        // JokeList()
       
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('主题'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          child: new ListView(
            children: <Widget>[
              page
            ],
          ),
        ));
  }
}
