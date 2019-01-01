import 'package:flutter/material.dart';

import 'package:flutter_app/app/components/jokeList.dart';

class MyPost extends StatefulWidget {
  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> with SingleTickerProviderStateMixin {

  @override 
   Widget build(BuildContext context) {
     TabController _tabController = TabController(vsync: this, length: choices.length);
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: choices.map((Choice choice) {
            return Tab(
              text: choice.title,
            );
          }).toList(),
        ),
        
       
      ),
      body: TabBarView(
        controller: _tabController,
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
    return Card(
      color: Colors.white,
      child: Center(child: JokeList()),
    );
  }
}
