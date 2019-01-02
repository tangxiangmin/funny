import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';

import 'package:flutter_app/app/components/form.dart';
import 'package:flutter_app/enum/iconfont.dart';

import 'package:flutter_app/enum/color.dart';
import 'package:flutter_app/app/api/base.dart';

import 'package:flutter_app/app/model/login.dart' as LoginModel;
import 'package:flutter_app/app/util/layer.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_app/enum/storage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username;
  String password;

  void login() {
    print("username:$username");
    print("password:$password");
  }

  void loginSuccess(){
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new FunApp()),
      );
  }
  @override
  Widget build(BuildContext context) {
    const baseColor = Color.fromRGBO(254, 110, 110, 1);

    void submit() async {
      try {
        var response = await HttpUtil.dio.get("/login");
        if (response.data != null) {
          LoginModel.login res = LoginModel.login.fromJson(response.data);
          if (res.code == 0) {
            LoginModel.Data data = res.data;

            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString(LocalStorage.loginToken, data.token);
            prefs.setString(LocalStorage.uid, data.uid.toString());

            loginSuccess();
          } else {
            Layer.toast(res.message);
          }
        }else {
          throw "请求失败";
        }
      } catch (e) {
        print(e);
        Layer.toast("网络错误，请稍后重试");
      }

      
    }

    Widget page = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CommonInput(
            text: "用户名或邮箱",
            icon: Icon(Icons.person),
            onChanged: (val) {
              setState(() {
                username = val;
              });
            }),
        CommonInput(
          text: "请输入你的密码",
          icon: Icon(Icons.lock),
          type: "password",
          onChanged: (val) {
            setState(() {
              password = val;
            });
          },
        ),
        CommonButton(onPressed: submit, text: "登录"),
        Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Text("没有账号？立即注册", style: TextStyle(color: baseColor))),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
                  child: Text("或者使用第三方登录",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                      ))),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(IconFont.weibo, size: 60, color: BaseColor.weibo),
            Icon(IconFont.wechat, size: 60, color: BaseColor.wechat),
            Icon(IconFont.qq, size: 60, color: BaseColor.qq),
          ],
        )
      ],
    );
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('登录'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          // color: Color.fromARGB(255, 100, 255, 255),
          child: new Column(
            children: <Widget>[
              // LoginPage(),
              // SetPage(),
              page
            ],
          ),
        ));
  }
}
