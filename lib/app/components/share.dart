
import 'package:flutter/material.dart';
import 'package:flutter_app/app/util/rem.dart';

class ShareUtil {
  static openShare(BuildContext context){
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
            _ShareIcon(image: AssetImage("assets/img/qq.png"), name: "QQ"),
            _ShareIcon(image: AssetImage("assets/img/qzone.png"), name: "空间"),
            _ShareIcon(image: AssetImage("assets/img/weixin.png"), name: "微信"),
          ]),
          share_row([
            _ShareIcon(image: AssetImage("assets/img/weibo.png"), name: "微博"),
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
  final AssetImage image;
  final String name;
  _ShareIcon({Key key, this.image, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconWidth = Adapt.px(100);
    return Container(
      width: iconWidth,
      margin: EdgeInsets.only(right: Adapt.px(50)),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: Adapt.px(23)),
            child: Image(
              image: image,
              width: iconWidth,
              height: iconWidth,
              fit: BoxFit.contain,
            ),
          ),
          Text(name, style: TextStyle(fontSize: Adapt.px(24)))
        ],
      ),
    );
  }
}
