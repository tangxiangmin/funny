import 'package:flutter/material.dart';

import 'package:flutter_app/app/view/login.dart';
import 'package:flutter_app/app/view/myPost.dart';


class MyPage extends StatefulWidget {
  @override
  MyState createState() => new MyState();
}

class MyState extends State<MyPage> {
  void _goLogin() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget createListItem({icon, text, onTap}) {
      return GestureDetector(
        onTap: onTap,
        child: new Container(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: new Icon(icon),
                ),
                new Text(text),
              ],
            ),
            new Icon(Icons.arrow_forward_ios)
          ],
        ),
      )
      ); 
    }

    Widget my = new Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 20.0),
      child: new ListView(children: <Widget>[
        new Container(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: _goLogin,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          "http://imgold.doufu.la/e3/63/7d2421e0c018f7bb52428e7f9f.png"),
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new Row(
                      children: <Widget>[
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text('登录/注册'),
                            new Text('欢迎来到段子社区')
                          ],
                        ),
                      ],
                    ),
                  ),
                  new Icon(Icons.arrow_forward_ios)
                ],
              ),
            )),
        new Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
          padding: const EdgeInsets.all(10.0),
          decoration: new BoxDecoration(
            border: new Border(
              bottom: BorderSide(width: 10.0, color: Colors.grey[100]),
            ),
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Column(
                children: <Widget>[new Text('0'), new Text('获赞')],
              ),
              new Column(
                children: <Widget>[new Text('0'), new Text('粉丝')],
              ),
              new Column(
                children: <Widget>[new Text('0'), new Text('关注')],
              )
            ],
          ),
        ),
        new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              createListItem(icon: Icons.event_note, text: '帖子', onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>MyPost())
                );
              }),
              createListItem(icon: Icons.comment, text: '评论', onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>MyPost())
                );
              }),
              createListItem(icon: Icons.collections, text: '收藏', onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>MyPost())
                );
              }),
              createListItem(icon: Icons.timeline, text: '观看历史', onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>MyPost())
                );
              }),
              createListItem(icon: Icons.terrain, text: '意见反馈', onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>MyPost())
                );
              }),
            ],
          ),
        )
      ]),
    );

    return new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          title: new Text('个人中心'),
        ),
        body: my);
  }
}
