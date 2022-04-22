import 'package:flutter/material.dart';
import 'collection.dart';

class TopicPage extends StatefulWidget {
  TopicPage({Key key}) : super(key: key);

  @override
  TopicPageSate createState() => TopicPageSate();
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
              MaterialPageRoute(builder: (context) => CollectionPage()),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(width: 1.0, color: Colors.grey[100]),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: Image.network(
                      'http://dummyimage.com/200x200/FF6600',
                      height: 60.0,
                      fit: BoxFit.cover,
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '保护我方沙雕',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text(
                          '2187个热门内容',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )),
                RaisedButton(
                    onPressed: () {
                      print("click关注");
                    },
                    child: Text('关注'),
                    textColor: Colors.white,
                    color: Colors.red)
              ],
            ),
          ));
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('主题'),
        ),
        body: Column(
          children: <Widget>[createTopic(), createTopic(), createTopic()],
        ));
  }
}
