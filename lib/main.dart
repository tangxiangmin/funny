import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

import 'package:flutter_app/home.dart';
import './store/index.dart';
import './app/router/index.dart';

// 监听路由变化
class TestNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print('didPush');
  }
}

void main() {
//    debugPaintSizeEnabled = true;
  runApp(MaterialApp(
      title: 'Fun',
      navigatorKey: RouterUtil.navigatorState,
      navigatorObservers: [TestNavigatorObserver()],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreProvider<AppState>(
        store: store,
        child: FunApp(),
      )));
}
