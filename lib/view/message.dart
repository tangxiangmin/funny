import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/rem.dart';

class MessagePage extends StatelessWidget {
  Widget itemBuilder(BuildContext context, int index) {
    return new GestureDetector(
        onTap: () {
          print('123');
        },
        child: _MessageItem());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('消息'),
        ),
        body: new ListView.builder(
          itemCount: 10,
          itemBuilder: itemBuilder,
        ));
  }
}

class _MessageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      height: Adapt.px(140),
      padding: EdgeInsets.only(left: Adapt.px(17), right: Adapt.px(17)),
      margin: EdgeInsets.only(bottom: Adapt.px(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: Adapt.px(25)),
            child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/img/default_avatar.png")),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("用户名", style: TextStyle(fontSize: Adapt.px(33))),
                    Text(
                      "09:30",
                      style: TextStyle(
                          fontSize: Adapt.px(24), color: Color(0xffa1a1a1)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("今天的热点哦",style: TextStyle(fontSize: Adapt.px(28),color: Color(0xff818181)),),
                    Container(
                      width: Adapt.px(40),
                      height: Adapt.px(40),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(Adapt.px(20))),
                      child: Center(
                        child: Text(
                          "3",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
