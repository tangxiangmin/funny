import 'package:flutter/material.dart';

import '../router/index.dart';

class DemoPage extends StatefulWidget {
  @override
  DemoPageState createState() => DemoPageState();
}

class DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                  ),
                  RaisedButton(
                    onPressed: () {
                      RouterUtil.toPaintPage();
                    },
                    child: Text('画布'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      RouterUtil.toWebviewPage();
                    },
                    child: Text('webview'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
