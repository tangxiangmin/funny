import 'package:flutter/material.dart';

import 'package:flutter_app/app/view/login.dart';
import 'package:flutter_app/app/view/myPost.dart';
import 'package:flutter_app/app/view/setting.dart';

import 'package:flutter_app/app/components/share.dart';
import 'package:flutter_app/enum/iconfont.dart';

class MyPage extends StatefulWidget {
  @override
  MyState createState() => MyState();
}

class MyState extends State<MyPage> {
  void _goLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget createListItem({icon, text, onTap}) {
      return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: Icon(icon),
                    ),
                    Text(text),
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ));
    }

    Widget my = Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 20.0),
      child: ListView(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: _goLogin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          "http://imgold.doufu.la/e3/63/7d2421e0c018f7bb52428e7f9f.png"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[Text('登录/注册'), Text('欢迎来到段子社区')],
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )),
        Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 10.0, color: Colors.grey[100]),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[Text('0'), Text('获赞')],
              ),
              Column(
                children: <Widget>[Text('0'), Text('粉丝')],
              ),
              Column(
                children: <Widget>[Text('0'), Text('关注')],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              createListItem(
                  icon: IconFont.post,
                  text: '帖子',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyPost()));
                  }),
              createListItem(
                  icon: IconFont.comment,
                  text: '评论',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyPost()));
                  }),
              createListItem(
                  icon: IconFont.collections,
                  text: '收藏',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyPost()));
                  }),
              createListItem(
                  icon: IconFont.advice,
                  text: '意见反馈',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyPost()));
                  }),
              createListItem(
                  icon: IconFont.setting,
                  text: '设置',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SetPage()));
                  }),
              createListItem(
                  icon: IconFont.share,
                  text: '邀请好友',
                  onTap: () {
                    ShareUtil.openShare(context);
                  }),
            ],
          ),
        )
      ]),
    );

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('个人中心'),
        ),
        body: my);
  }
}
