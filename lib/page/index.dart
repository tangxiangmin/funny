import 'package:flutter/material.dart';
import 'tabPage.dart';

class IndexPage extends TabPage {
    IndexPage({Key key});

    @override
    Widget getPageBody() {
        Widget createListItem() {
            return new Container(
                color: Colors.white,
                padding: const EdgeInsets.all(30.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                child: new Column(
                    children: <Widget>[
                        new Container(
                            child: new Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                    new Row(children: <Widget>[
                                        new Image.network(
                                            'http://dummyimage.com/200x200/FF6600',
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                        ),
                                        new Container(
                                            margin: const EdgeInsets.only(
                                                left: 10.0),
                                            child: new Text('用户名'),)
                                        ,
                                    ],),
                                    new Icon(Icons.close)
                                ],
                            ),),
                        new Container(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10.0),
                            child: new Text(
                                '''
1211 Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''', softWrap: true,),
                        ),
                        new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                new Row(children: <Widget>[
                                    new Icon(Icons.thumb_up,
                                        color: Colors.grey,),
                                    new Text('20')
                                ],),
                                new Row(children: <Widget>[
                                    new Icon(
                                        Icons.comment, color: Colors.grey),
                                    new Text('20')
                                ],),
                                new Row(children: <Widget>[
                                    new Icon(
                                        Icons.share, color: Colors.grey),
                                    new Text('20')
                                ],)
                            ],
                        )
                    ],
                ),
            );
        }

        List<Widget> items = [];
        for (int i = 0; i < 10; ++i) {
            items.add(createListItem());
        }
        Widget index = new Container(
            color: Color(int.parse('dedede', radix: 16)),
            child: new ListView(
                children: items,),
        );
        return index;
    }
}