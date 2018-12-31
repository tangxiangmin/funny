import 'package:flutter/material.dart';

import 'package:flutter_app/app/components/iconTab.dart';

import 'package:flutter_app/app/view/index.dart';
import 'package:flutter_app/app/view/my.dart';
import 'package:flutter_app/app/view/topic.dart';


const TAB_INDEX = {
    'home': 0,
    'topic': 1,
    'my': 2,
};

class FunApp extends StatefulWidget {
    @override
    HomeState createState() => new HomeState();
}

class HomeState extends State<FunApp> with SingleTickerProviderStateMixin {
    int _currentIndex = 0;
    TabController _controller;
    VoidCallback onChanged;
    
    @override
    void initState() {
        super.initState();

        _controller = new TabController(initialIndex: _currentIndex, length: 3, vsync: this);
        onChanged = () {
            setState(() {
                _currentIndex = this._controller.index;
            });
        };

        _controller.addListener(onChanged);
    }

    @override
    void dispose() {
        _controller.removeListener(onChanged);
        _controller.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            bottomNavigationBar: new TabBar(
                controller: _controller,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: new TextStyle(fontSize: 12.0),
                tabs: <IconTab>[
                    new IconTab(
                        icon: _currentIndex == TAB_INDEX['home'] ? 'assets/tab/home_on.png' : 'assets/tab/home.png',
                        text: "职位",
                        color: Colors.grey[900]
                    ),
                     new IconTab(
                        icon: _currentIndex == TAB_INDEX['topic'] ? 'assets/tab/topic_on.png' : 'assets/tab/topic.png',
                        text: "发现",
                        color: Colors.grey[900]
                    ),
                    new IconTab(
                        icon: _currentIndex == TAB_INDEX['my'] ? 'assets/tab/my_on.png' : 'assets/tab/my.png',
                        text: "我的",
                        color: Colors.grey[900]
                    ),
                ],
            ),
            body: new TabBarView(
                children: <Widget>[
                    new IndexPage(),
                    new TopicPage(),
                    new MyPage(),
                ],
                controller: _controller,
            )
        );
    }
}

