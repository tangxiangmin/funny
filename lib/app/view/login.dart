import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';

import 'package:flutter_app/app/components/form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const baseColor = Color.fromRGBO(254, 110, 110, 1);

    void submit() {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new FunApp()),
      );
    }

    Widget page =  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CommonInput(text: "用户名或邮箱", icon: Icon(Icons.person)),
        CommonInput(text: "请输入你的密码", icon: Icon(Icons.lock)),
        CommonButton(onPressed: submit,),
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
            Image(
                image: AssetImage("assets/img/weibo.png"),
                width: 60.0,
                fit: BoxFit.contain),
            Image(
                image: AssetImage("assets/img/qq.png"),
                width: 60.0,
                fit: BoxFit.contain),
            Image(
                image: AssetImage("assets/img/weixin.png"),
                width: 60.0,
                fit: BoxFit.contain),
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
        )
    );
  }
}
