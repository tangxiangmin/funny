import 'package:flutter/material.dart';

import 'package:flutter_app/app/components/form.dart';
import 'package:flutter_app/app/view/login.dart';
import 'package:flutter_app/app/util/rem.dart';

class SetPage extends StatefulWidget {
  SetPage({Key key}) : super(key: key);

  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  bool _checked = false;
  bool _isSwitch = false;

  Widget build(BuildContext context) {
    Widget page = Column(
      children: <Widget>[
        SwitchListTile(
          value: _checked,
          onChanged: (isSwitch) {
            setState(() {
              _checked = isSwitch;
            });
          },
          title: Text("夜间模式"),
          secondary: Icon(
            Icons.message,
            color: Colors.blueAccent,
          ),
        ),
        Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        SwitchListTile(
          value: _isSwitch,
          onChanged: (isSwitch) {
            setState(() {
              _isSwitch = isSwitch;
            });
          },
          title: Text("新消息提醒"),
          secondary: Icon(
            Icons.message,
            color: Colors.blueAccent,
          ),
        ),
        Divider(
          height: 1.0,
          color: Colors.grey,
        ),
        Container(
            margin: EdgeInsets.only(top: Adapt.px(50)),
            child: CommonButton(
              text: "退出登录",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            )),
      ],
    );
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('设置'),
        ),
        body: Container(
          padding: EdgeInsets.only(left: Adapt.px(20), right: Adapt.px(20)),
          child: page,
        ));
  }
}
