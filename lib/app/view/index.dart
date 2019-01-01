import 'package:flutter/material.dart';

import 'package:flutter_app/app/components/jokeList.dart';

class IndexPage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
          elevation: 0.0,
        ),
        body: Container(
            color: Color(int.parse('dedede', radix: 16)), child: JokeList()));
  }
}
