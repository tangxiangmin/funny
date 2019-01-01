
import 'package:flutter/material.dart';

/**
 * iconfont 字体类
 */

String fontFamily = 'iconfont';


class IconFont {
  static IconData share = _Parser.parse("&#xe615;");
  static IconData post = _Parser.parse("&#xe62d;");

  static IconData comment = _Parser.parse("&#xe6a7;");
  static IconData collections = _Parser.parse("&#xe613;");
  static IconData advice = _Parser.parse("&#xe649;");
  static IconData setting = _Parser.parse("&#xe624;");
  static IconData like = _Parser.parse("&#xe699;");

  static IconData qq = _Parser.parse("&#xe656;");
  static IconData qzone = _Parser.parse("&#xe658;");
  static IconData wechat = _Parser.parse("&#xe65b;");
  static IconData moments = _Parser.parse("&#xe669;");
  static IconData weibo = _Parser.parse("&#xe653;");
  static IconData link = _Parser.parse("&#xe63c;");
}

class _Parser {
  static parse(String unicode){
    var code =  '0' + unicode.substring(2,7);
    return IconData(int.parse(code), fontFamily: fontFamily);
  }
}