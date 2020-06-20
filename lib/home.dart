import 'package:flutter/material.dart';

import 'package:flutter_app/app/components/iconTab.dart';
import 'package:flutter_app/app/view/my.dart';
import 'package:flutter_app/app/view/message.dart';
import 'package:flutter_app/app/view/topic.dart';
import 'package:flutter_app/app/view/paint.dart';
import 'package:flutter_app/app/view/webview.dart';
import 'package:flutter_app/app/view/demo.dart';

import './store/index.dart';
import './store/module/user.dart';

const TAB_INDEX = {
  'home': 0,
  'topic': 1,
  'message': 2,
  'my': 3,
};

class FunApp extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<FunApp> with SingleTickerProviderStateMixin,WidgetsBindingObserver {
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChanged;
  BuildContext _context;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);

    var route = ModalRoute.of(_context);
    if(route!=null){
      print(route.settings.name);
    }

  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    store.dispatch(localLoginAction); // 获取本地登录信息

    _controller =
        TabController(initialIndex: _currentIndex, length: 4, vsync: this);
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
    _context = context;
    Widget body = Scaffold(
        bottomNavigationBar: TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(fontSize: 12.0),
          tabs: <IconTab>[
            IconTab(
                icon: _currentIndex == TAB_INDEX['home']
                    ? 'assets/tab/home_on.png'
                    : 'assets/tab/home.png',
                text: "首页",
                color: Colors.grey[900]),
            IconTab(
                icon: _currentIndex == TAB_INDEX['topic']
                    ? 'assets/tab/topic_on.png'
                    : 'assets/tab/topic.png',
                text: "发现",
                color: Colors.grey[900]),
            IconTab(
                icon: _currentIndex == TAB_INDEX['message']
                    ? 'assets/tab/message_on.png'
                    : 'assets/tab/message.png',
                text: "消息",
                color: Colors.grey[900]),
            IconTab(
                icon: _currentIndex == TAB_INDEX['my']
                    ? 'assets/tab/my_on.png'
                    : 'assets/tab/my.png',
                text: "我的",
                color: Colors.grey[900]),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            DemoPage(),
//            PaintPage(),
//            IndexPage(),
            TopicPage(),
            MessagePage(),
            MyPage(),
          ],
          controller: _controller,
        ));
    return SafeArea(
      bottom: true,
      child: SizedBox.expand(
        child: body,
      ),
    );
  }
}
