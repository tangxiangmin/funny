import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_app/app/view/detail.dart';
import 'package:flutter_app/app/item/jokeItem.dart';

import '../../store/module/joke.dart' as Joke;
import '../../store/index.dart';

class JokeList extends StatefulWidget {
  JokeList({Key key}) : super(key: key);

  @override
  _JokeLitState createState() => _JokeLitState();
}

class _JokeLitState extends State<JokeList> {
  @override
  void initState() {
    super.initState();

    // 初始化数据
    store.dispatch(Joke.fetchList);
  }

  @override
  Widget build(BuildContext context) {
    Widget page = connect((store) {
      return store.state.joke.jokes;
    }, (context, jokes, store) {
      return ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (BuildContext context, int index) {
            var joke = jokes[index];
            return new GestureDetector(
                onTap: () {
                  int id = joke.id;
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new TextDetailPage(id)),
                  );
                },
                child: JokeItem(joke: joke));
          });
    });

    return Container(
      color: Color(int.parse('dedede', radix: 16)),
      child: page,
    );
  }
}
