import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
    @override
    _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
    bool _isFavorited = true;
    int _favoriteCount = 41;

    void _toggleFavorite() {
        setState(() {
            // If the lake is currently favorited, unfavorite it.
            if (_isFavorited) {
                _favoriteCount -= 1;
                _isFavorited = false;
                // Otherwise, favorite it.
            } else {
                _favoriteCount += 1;
                _isFavorited = true;
            }
        });
    }

    @override
    Widget build(BuildContext context) {
        return new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                new Container(
                    padding: new EdgeInsets.all(0.0),
                    child: new IconButton(
                        icon: (_isFavorited
                            ? new Icon(Icons.star)
                            : new Icon(Icons.star_border)),
                        color: Colors.red[500],
                        onPressed: _toggleFavorite,
                    ),
                ),
                new SizedBox(
                    width: 18.0,
                    child: new Container(
                        child: new Text('$_favoriteCount'),
                    ),
                ),
            ],
        );
    }
}

class MyHomePage extends StatelessWidget {
    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;

    @override
    Widget build(BuildContext context) {
        Widget body = new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    new Text(
                        'You have push12d !!!the button this many times:',
                    ),
                    new Text(
                        '123',
                        style: Theme
                            .of(context)
                            .textTheme
                            .display1,
                    ),
                ],
            ),
        );
        Column buildButtonColumn(IconData icon, String label) {
            Color color = Theme
                .of(context)
                .primaryColor;

            return new Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    new Icon(icon, color: color,),
                    new Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: new Text(
                            label, style: new TextStyle(fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: color),),
                    )
                ],
            );
        }
        Widget body2 = new Container(
            padding: const EdgeInsets.all(32.0),
            margin: const EdgeInsets.only(bottom: 10.0),
            child: new Column(
                children: [
                    new Image.network(
                        'http://dummyimage.com/200x200/FF6600',
                        height: 200.0,
                        fit: BoxFit.cover,
                    ),
                    new Container(
                        margin: const EdgeInsets.only(bottom: 30.0),
                        child: new Row(
                            children: <Widget>[
                                new Expanded(
                                    child: new Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                            new Container(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: new Text(
                                                    'Oeschinen Lake Campground',
                                                    style: new TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                    ),
                                                ),
                                            ),
                                            new Text(
                                                'Kandersteg, Switzerland',
                                                style: new TextStyle(
                                                    color: Colors.grey[500],
                                                ),
                                            ),
                                        ],
                                    )),
                                new FavoriteWidget()
                            ],),
                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                            buildButtonColumn(Icons.call, 'CALL'),
                            buildButtonColumn(Icons.near_me, 'ROUTE'),
                            buildButtonColumn(Icons.share, 'SHARE'),
                        ],),
                    new Container(
                        padding: const EdgeInsets.all(32.0),
                        child: new Text(
                            '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''', softWrap: true,),
                    )

                ],
            ),
        );

        return new Scaffold(
            appBar: new AppBar(
                title: new Text('Hello'),
            ),
            body: body2
        );
    }
}
