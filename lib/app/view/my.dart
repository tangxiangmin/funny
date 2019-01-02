import 'package:flutter/material.dart';

import 'package:flutter_app/app/components/share.dart';
import 'package:flutter_app/enum/iconfont.dart';

import 'package:flutter_app/app/view/login.dart';
import 'package:flutter_app/app/view/myPost.dart';
import 'package:flutter_app/app/view/setting.dart';
import 'package:flutter_app/app/view/advice.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/enum/storage.dart';
import 'package:flutter_app/app/api/base.dart';
import 'package:flutter_app/app/model/user_info.dart' as UserInfoModel;

class MyPage extends StatefulWidget {
  @override
  MyState createState() => MyState();
}

class MyState extends State<MyPage> {
  bool _isLogin = false;
  UserInfoModel.Data _user;

  void _goLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginToken = prefs.get(LocalStorage.loginToken);
    // String uid = prefs.get(LocalStorage.uid);
    print(loginToken);
    setState(() {
      _isLogin = loginToken != null;
      if (_isLogin) {
        getUserInfo();
      }
    });
  }

  void getUserInfo() async {
    try {
      var response = await HttpUtil.dio.get("/userInfo");
      if (response.data != null) {
        UserInfoModel.user_info res =
            UserInfoModel.user_info.fromJson(response.data);
        if (res.code == 0) {
          UserInfoModel.Data data = res.data;
          setState(() {
            print("update");
            _user = data;
          });
        } else {
          throw res.message;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void reassemble() {
    super.reassemble();
    init();
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

    ImageProvider avatar = _user?.avatar != null
        ? NetworkImage(_user.avatar)
        : AssetImage("assets/img/default_avatar.png");
    String userName = _user?.nickname != null ? _user.nickname : '登录/注册';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[Text(_user?.likeNum.toString() ?? "0"), Text('获赞')],
              ),
              Column(
                children: <Widget>[Text(_user?.fansNum.toString() ?? "0"), Text('粉丝')],
              ),
              Column(
                children: <Widget>[Text(_user?.focusNum.toString() ?? "0"), Text('关注')],
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
