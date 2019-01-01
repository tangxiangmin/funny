import 'package:flutter/material.dart';
import 'package:flutter_app/app/util/rem.dart';
import 'package:flutter_app/enum/iconfont.dart';
import 'package:flutter_app/enum/color.dart';

class ShareUtil {
  static openShare(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SharePopup();
        });
  }
}

class SharePopup extends StatefulWidget {
  SharePopup({Key key}) : super(key: key);

  @override
  _SharePopupState createState() => new _SharePopupState();
}

class _SharePopupState extends State<SharePopup> {
  Widget build(BuildContext context) {
    Widget share_row(children) {
      return Container(
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.only(top: 20, bottom: 20),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(217, 217, 217, 1)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: children,
        ),
      );
    }

    Widget share_bd = Container(
      child: Column(
        children: <Widget>[
          share_row([
            _ShareIcon(icon: IconFont.wechat, name: "微信", color: BaseColor.wechat),
            _ShareIcon(icon: IconFont.qq, name: "QQ", color: BaseColor.qq),
            _ShareIcon(icon: IconFont.qzone, name: "空间", color: BaseColor.qzone),
            _ShareIcon(icon: IconFont.wechat, name: "朋友圈", color: BaseColor.moments),
          ]),
          share_row([
            _ShareIcon(icon: IconFont.weibo, name: "微博", color: BaseColor.weibo,),
          ]),
        ],
      ),
    );

    Widget share_ft = Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: Text("取消", style: TextStyle(fontSize: Adapt.px(30))),
      ),
    );

    Widget share = Container(
      height: Adapt.px(600),
      child: Column(
        children: <Widget>[share_bd, share_ft],
      ),
    );
    return share;
  }
}

class _ShareIcon extends StatelessWidget {
 
  _ShareIcon({
    Key key, 
    this.icon, 
    this.name, 
    this.color, 
    this.size,
  }) : super(key: key);

  final IconData icon;
  final String name;
  final Color color;
  double size;

  @override
  Widget build(BuildContext context) {
    size = size ?? Adapt.px(100);

    return Container(
      width: size,
      margin: EdgeInsets.only(right: Adapt.px(50)),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: Adapt.px(23)),
              child: Icon(icon, size: size, color: color)),
          Text(name, style: TextStyle(fontSize: Adapt.px(24)))
        ],
      ),
    );
  }
}
