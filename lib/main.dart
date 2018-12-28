import 'package:flutter/material.dart';

import 'package:flutter_app/home.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main(){
//    debugPaintSizeEnabled = true;
    runApp(new MaterialApp(
        title: 'Fun',
        theme: new ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: new FunApp()
    ));

}


