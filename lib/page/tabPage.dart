import 'package:flutter/material.dart';
import 'index.dart';
import 'login.dart';
import 'my.dart';

class TabPage extends StatelessWidget {

    Widget getPageBody() {
        return new Container();
    }

    @override
    Widget build(BuildContext context) {
        Widget page = this.getPageBody();

        Widget createNavIcon(icon, tapHandler) {
            return new GestureDetector(
                onTap: tapHandler,

                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        new Icon(icon, color: Colors.yellow),
                    ],
                ));
        }

        void jumpPage(page) {
            Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => page)
            );
        }
        Widget bottomNav = new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
                new BottomNavigationBarItem(
                    icon: createNavIcon(Icons.home, () {
                        jumpPage(new IndexPage());
                    }),
                    title: new Text('首页')
                ),
                new BottomNavigationBarItem(
                    icon: createNavIcon(Icons.person, () {
                        jumpPage(new MyPage());
                    }),
                    title: new Text('我的')
                )
            ],
        );


        return new Scaffold(
            appBar: new AppBar(
                title: new Text('Index'),
            ),
            bottomNavigationBar: bottomNav,
            body: page
        );
    }
}