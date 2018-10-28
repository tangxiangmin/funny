import 'package:flutter/material.dart';

import 'package:flutter_app/app/components/icon_tab.dart';

import 'package:flutter_app/app/view/index.dart';
import 'package:flutter_app/app/view/my.dart';


const TAB_INDEX = {
    'home': 0,
    'my': 1,
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

        _controller =
        new TabController(initialIndex: _currentIndex, length: 2, vsync: this);
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
                        icon: _currentIndex == TAB_INDEX['home'] ? 'assets/img/ic_main_tab_company_pre.png' : 'assets/img/ic_main_tab_company_nor.png',
                        text: "职位",
                        color: Colors.grey[900]
                    ),
                    new IconTab(
                        icon: _currentIndex == TAB_INDEX['my'] ? 'assets/img/ic_main_tab_my_pre.png' : 'assets/img/ic_main_tab_my_nor.png',
                        text: "我的",
                        color: Colors.grey[900]
                    ),
                ],
            ),
            body: new TabBarView(
                children: <Widget>[
                    new IndexPage(),
                    new MyPage(),
                ],
                controller: _controller,
            )
        );
    }
}