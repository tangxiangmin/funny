import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Layer {
  static void toast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        // backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}
