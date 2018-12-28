import 'package:flutter/material.dart';

class MyPost extends StatefulWidget {
  const MyPost({Key key}) : super(key: key);

  @override
  _MyPostState createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的帖子'),
        ),
        body: Container(
            margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: TabBarView(
              controller: _tabController,
              
              children: myTabs.map((Tab tab) {
                return Center(child: Text(tab.text));
              }).toList(),
            )));
  }
}
