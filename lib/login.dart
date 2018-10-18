import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
    LoginPage({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        void submit(){

        }
        Widget login = new Center(
            child: new Container(
                width: 300.0,
                height: 400.0,
                padding: const EdgeInsets.all(32.0),
                color: Colors.yellow,
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        new Image.network(
                            'http://dummyimage.com/200x200/FF6600',
                            height: 100.0,
                            fit: BoxFit.cover,
                        ),
                        new TextField(
                            decoration: InputDecoration(
//                                border: InputBorder.none,
                                hintText: '请输入用户名',
                            )
                        ),
                        new TextField(
                            decoration: InputDecoration(
//                                border: InputBorder.none,
                                hintText: '请输入密码',
                            )
                        ),
                        new RaisedButton(
                            onPressed: submit,
                            child: new Text('确认登录'),
                            textColor: Colors.white,
                            color: Colors.yellow
                        )
                    ],
                ),)


        );

        return new Scaffold(
            appBar: new AppBar(
                title: new Text('Login'),
            ),
            body: login
        );
    }
}