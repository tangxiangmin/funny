import 'package:flutter/material.dart';

//import '1.dart';
//import '2.dart';
import 'package:flutter_app/app/view/login.dart';
import 'package:flutter_app/app/view/my.dart';
import 'package:flutter_app/app/view/detail.dart';

import 'package:flutter_app/home.dart';

void main() =>
    runApp(new MaterialApp(
        title: 'Fun',
        theme: new ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: new FunApp()
    ));

