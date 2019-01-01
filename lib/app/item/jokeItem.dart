import 'package:flutter/material.dart';
import 'package:flutter_app/app/model/joke_list.dart' as JokeListModel;

import 'package:flutter_app/enum/iconfont.dart';
import 'package:flutter_app/app/components/share.dart';

class JokeItem extends StatefulWidget {
  final JokeListModel.Data joke;

  JokeItem({Key key, this.joke}) : super(key: key);

  @override
  JokeItemSate createState() => JokeItemSate();
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

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.network(
                      author.avatar,
                      height: 50.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Text(author.nickname),
                    ),
                  ],
                ),
                Icon(Icons.close)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              detail.content,
              softWrap: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    IconFont.like,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(joke.likeNum.toString()),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(IconFont.comment, color: Colors.grey),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(joke.commentNum.toString()),
                  )
                ],
              ),
              GestureDetector(
                onTap: (){
                    ShareUtil.openShare(context);
                },
                child:  Icon(IconFont.share, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
