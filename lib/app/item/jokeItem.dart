import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/joke_list.dart' as JokeListModel;

class JokeItem extends StatefulWidget {
    final JokeListModel.Data joke;

    JokeItem({
      Key key,
      this.joke
    }) :super(key: key);

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
        var joke = widget.joke;
        var author = joke.author;
        var detail = joke.joke;

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
                                        author.avatar,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                    ),
                                    new Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: new Text(author.nickname),)
                                    ,
                                ],),
                                new Icon(Icons.close)
                            ],
                        ),),
                    new Container(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0),
                        child: new Text(detail.content, softWrap: true,),
                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            new Row(children: <Widget>[
                                new Icon(Icons.thumb_up,
                                    color: Colors.grey,),
                                new Text(joke.likeNum.toString())
                            ],),
                            new Row(children: <Widget>[
                                new Icon(
                                    Icons.comment, color: Colors.grey),
                                new Text(joke.commentNum.toString())
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