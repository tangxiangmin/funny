import 'package:flutter/material.dart';

import 'package:flutter_app/home.dart';

void main() =>
    runApp(new MaterialApp(
        title: 'Fun',
        theme: new ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: new FunApp()
    ));

