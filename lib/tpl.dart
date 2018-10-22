import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
    IndexPage({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {

        Widget createNavIcon(icon) {
            return new Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    new Icon(icon, color: Colors.yellow),
                ],
            );
        }


        return new Scaffold(
            appBar: new AppBar(
                title: new Text('Index'),
            ),
            bottomNavigationBar: new BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                    new BottomNavigationBarItem(
                        icon: createNavIcon(Icons.home),
                        title: new Text('首页')
                    ),
                    new BottomNavigationBarItem(
                        icon: createNavIcon(Icons.person),
                        title: new Text('我的')
                    )
                ],
            ),
            body: new Container()
        );
    }
}