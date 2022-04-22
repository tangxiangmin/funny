import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_app/home.dart';
import './store/index.dart';
import './router/index.dart';

// 监听路由变化
class TestNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    print('didPush');
  }
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //填入设计稿中设备的屏幕尺寸,单位dp
    return ScreenUtilInit(
      designSize: Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
          title: 'Fun',
          navigatorKey: RouterUtil.navigatorState,
          navigatorObservers: [TestNavigatorObserver()],
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StoreProvider<AppState>(
            store: store,
            child: FunApp(),
          )),
    );
  }
}

void main() {
  runApp(RootApp());
}
