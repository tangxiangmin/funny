import 'package:flutter/material.dart';

class TextDetailPage extends StatelessWidget {
    TextDetailPage({Key key}) : super(key: key);

    Widget buildTextField(TextEditingController controller) {
        return TextField(
            controller: controller,
        );
    }

    @override
    Widget build(BuildContext context) {
        final controller = TextEditingController();
        controller.addListener(() {
            print('input ${controller.text}');
        });

        void addCollection() {
            print('Hello, World!');
        }

        Widget header = new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                new Icon(Icons.arrow_back_ios),
                new Image.network(
                    'http://dummyimage.com/200x200/FF6600',
                    height: 50.0,
                    fit: BoxFit.cover,
                ),
                new Column(children: <Widget>[
                    new Text('用户名xxx'),
                    new Text('10小时前')
                ],),
                new RaisedButton(
                    onPressed: addCollection,
                    child: new Text('关注'),
                    textColor: Colors.white,
                    color: Colors.blue
                ),
                new Icon(Icons.star_border,),
                new Icon(Icons.share)
            ],
        );
        Widget detail = new Container(
            child:
            new Text(
                'ad发大发阿凡达发大水发士大夫答复答复爱迪生发 阿斯蒂芬大师傅答复爱迪生范德萨发ad发大发阿凡达发大水发士大夫答复答复爱迪生发 阿斯蒂芬大师傅答复爱迪生范德萨发ad发大发阿凡达发大水发士大夫答复答复爱迪生发 阿斯蒂芬大师傅答复爱迪生范德萨发'),
        );

        Widget createCommentItem(){
            return new Row(
                children: <Widget>[
                    new Image.network(
                        'http://dummyimage.com/200x200/FF6600',
                        height: 50.0,
                        fit: BoxFit.cover,
                    ),
                    new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            new Row(
                                children: <Widget>[
                                    new Text('用户名想 想想想'),
                                    new Icon(Icons.thumb_up)
                                ],
                            ),
                            new Text('评论内容评论内容评论内容'),
                            new Text('9小时前'),
                        ],)
                ],
            );
        }

        Widget body = new Container(
            child: new Column(
                children: <Widget>[
                    createCommentItem(),
                    createCommentItem(),
                    createCommentItem(),
                    createCommentItem(),
                ],
            )
        );

        Widget footer = new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                new SizedBox(
                    width: 150.0,
                    child: new TextField(
                        decoration: InputDecoration(
                            hintText: '说点什么...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                            ),
                        )
                    ),
                ),
                new Row(children: <Widget>[
                    new Icon(Icons.thumb_up),
                    new Text('21')
                ],),
                new Row(children: <Widget>[
                    new Icon(Icons.comment),
                    new Text('32')
                ],),
                new Icon(Icons.screen_share)
            ],);

        return new Scaffold(
            appBar: new AppBar(
                title: new Text('Detail'),
            ),
            body: new Container(
                padding: const EdgeInsets.all(20.0),
                child: new Column(
                    children: <Widget>[
                        header,
                        new Expanded(child: new ListView(
                            children: <Widget>[
                                detail,
                                body,
                            ],
                        )),

                        footer
                    ],

                ),)
        );
    }
}