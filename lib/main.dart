import 'package:flutter/material.dart';

import 'package:flutter_app/home.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
//    debugPaintSizeEnabled = true;
  runApp(MaterialApp(
      title: 'Fun',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FunApp()));
}
