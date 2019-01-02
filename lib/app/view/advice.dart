import 'package:flutter/material.dart';

import 'package:flutter_app/app/components/form.dart';

class AdvicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("意见反馈"),
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: CommonInput(
                text: "请输入你要反馈的问题...",
                maxLines: 5,
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(color: Color(0xf5f5f2ff)),
              child: Text("截屏可以帮助我们更快解决问题哦~"),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Wrap(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10, bottom: 10),
                    width: 100,
                    height: 100,
                    color: Color(0xf5f5f2ff),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.add_a_photo),
                        Text("添加图片", style: TextStyle(height: 1.5))
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Color(0xf5f5f2ff),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.network(
                            "http://imgold.doufu.la/e3/63/7d2421e0c018f7bb52428e7f9f.png")
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: CommonButton(text: "提交反馈", onPressed:(){
                print("点击提交反馈");
              }),
            )
          ],
        ));
  }
}
