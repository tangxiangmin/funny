import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_app/components/share.dart';
import 'package:flutter_app/enum/iconfont.dart';

import 'package:flutter_app/view/login.dart';
import 'package:flutter_app/view/myPost.dart';
import 'package:flutter_app/view/setting.dart';
import 'package:flutter_app/view/advice.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/enum/storage.dart';
import 'package:flutter_app/api/base.dart';
import 'package:flutter_app/model/user_info.dart' as UserInfoModel;

import '../../store/index.dart';
import '../../store/module/user.dart';

class MyPage extends StatefulWidget {
  @override
  MyState createState() => MyState();
}

class MyState extends State<MyPage> {
  @override
  void initState() {
    super.initState();

    AppState state = store.state;
    // 存在数据时请求用户信息
    if (state.user.token != null) {
      store.dispatch(fetchUserInfoAction());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('个人中心'),
        ),
        body: _MyPage());
  }
}

class _MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _goLogin() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }

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

    Widget navList = Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          createListItem(
              icon: IconFont.post,
              text: '帖子',
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyPost()));
              }),
          createListItem(
              icon: IconFont.collections,
              text: '收藏',
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyPost()));
              }),
          createListItem(
              icon: IconFont.advice,
              text: '意见反馈',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdvicePage()));
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
    );

    return connect((store) {
      return store.state.user.userInfo;
    }, (context, _user, store) {
      ImageProvider avatar = _user?.avatar != null
          ? NetworkImage(_user.avatar)
          : AssetImage("assets/img/default_avatar.png");
      String userName = _user?.nickname != null ? _user.nickname : '登录/注册';

      Widget dataBar = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(_user?.likeNum.toString() ?? "0"),
              Text('获赞')
            ],
          ),
          Column(
            children: <Widget>[
              Text(_user?.fansNum.toString() ?? "0"),
              Text('粉丝')
            ],
          ),
          Column(
            children: <Widget>[
              Text(_user?.focusNum.toString() ?? "0"),
              Text('关注')
            ],
          )
        ],
      );

      return Container(
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
                      child: CircleAvatar(radius: 35, backgroundImage: avatar),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(userName, style: TextStyle(fontSize: 18)),
                              Text('欢迎来到段子社区')
                            ],
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
            child: dataBar,
          ),
          navList
        ]),
      );
    });
  }
}
