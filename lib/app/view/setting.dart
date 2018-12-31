import 'package:flutter/material.dart';

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
          margin: EdgeInsets.only(top: 40.0, left: 20, right: 20),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("退出登录"),
                ),
              ),
            ],
          ),
        )
      ],
    );
    return new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          title: new Text('个人中心'),
        ),
        body: page);
  }
}
