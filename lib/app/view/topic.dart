import 'package:flutter/material.dart';
import 'collection.dart';

class TopicPage extends StatefulWidget {
  TopicPage({Key key}) : super(key: key);

  @override
  TopicPageSate createState() => new TopicPageSate();
}

class TopicPageSate extends State<TopicPage> {
  @override
  Widget build(BuildContext context) {
    Widget createTopic() {
      return GestureDetector(
          onTap: () {
            print("xxx");
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new CollectionPage()),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
            decoration: new BoxDecoration(
                border: new Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey[100]),
            )),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: new Image.network(
                      'http://dummyimage.com/200x200/FF6600',
                      height: 60.0,
                      fit: BoxFit.cover,
                    )),
                new Expanded(
                    flex: 1,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          '保护我方沙雕',
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        new Text(
                          '2187个热门内容',
                          style: new TextStyle(color: Colors.grey),
                        )
                      ],
                    )),
                new RaisedButton(
                    onPressed: () {
                      print("click关注");
                    },
                    child: new Text('关注'),
                    textColor: Colors.white,
                    color: Colors.red)
              ],
            ),
          ));
    }

    return new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          title: new Text('主题'),
        ),
        body: Column(
          children: <Widget>[createTopic(), createTopic(), createTopic()],
        ));
  }
}
