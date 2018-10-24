import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/joke.dart';

class JokeItem extends StatefulWidget {
    final JokeModel joke;

    JokeItem(this.joke);

    @override
    JokeItemSate createState() => new JokeItemSate();
}

class JokeItemSate extends State<JokeItem> {

    @override
    void initState() {
        super.initState();
        // todo 接收传递过来的内容数据
    }

    @override
    Widget build(BuildContext context) {
        return new Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
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
121232111 Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
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
}