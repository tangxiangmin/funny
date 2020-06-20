import 'package:flutter/material.dart';

// 相关页面
import '../view/webview.dart';
import '../view/paint.dart';
import '../view/login.dart';

// 保存全局context 参考：https://github.com/flutter/flutter/issues/32304
// 可以在Widget之外的其他地方获取context用于路由跳转等

// 暴露路由工具
class RouterUtil {
  // 在入口文件MaterialApp 传入navigatorKey
  static GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

  static toWebviewPage() {
    navigatorState.currentState.push(
      MaterialPageRoute(builder: (context) => WebViewPage()),
    );
  }

  static toLoginPage() {
    navigatorState.currentState.push(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  static toPaintPage() {
    navigatorState.currentState.push(
      MaterialPageRoute(builder: (context) => PaintPage()),
    );
//    Navigator.push(
//      navigatorState.currentContext,
//      new MaterialPageRoute(builder: (context) => new PaintPage()),
//    );
  }
}
