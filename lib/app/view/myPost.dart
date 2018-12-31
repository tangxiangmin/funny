import 'package:flutter/material.dart';

import 'package:flutter_app/app/components/jokeList.dart';

class MyPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('我的'),
        bottom: TabBar(
          isScrollable: true,
          tabs: choices.map((Choice choice) {
            return Tab(
              text: choice.title,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        children: choices.map((Choice choice) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ChoiceCard(choice: choice),
          );
        }).toList(),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: '动态', icon: Icons.directions_car),
  const Choice(title: '帖子', icon: Icons.directions_bike),
  const Choice(title: '评论', icon: Icons.directions_boat),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(child: JokeList()),
    );
  }
}
