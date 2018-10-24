import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';

class LoginPage extends StatelessWidget {
    LoginPage({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        void submit() {
            Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new FunApp()),
            );
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
                        new Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: new BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: new DecorationImage(
                                    image: new NetworkImage(
                                        'http://dummyimage.com/200x200/FF6600'),
                                    fit: BoxFit.cover,
                                ),
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(50.0)),

                            ),
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
                            color: Colors.blue
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