import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

import 'package:flutter_app/home.dart';
import './store/index.dart';

void main() {
//    debugPaintSizeEnabled = true;
  runApp(new StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: 'Fun',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: FunApp())));
}
