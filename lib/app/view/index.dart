import 'package:flutter/material.dart';

import 'package:flutter_app/app/components/jokeList.dart';

class IndexPage extends StatefulWidget {
    @override
    HomeState createState() => new HomeState();
}

class HomeState extends State<IndexPage> {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                elevation: 0.0,
                title: new Text('Index'),
            ),
            body: new Container(
                color: Color(int.parse('dedede', radix: 16)),
                child: JokeList()
            )
        );
    }

}