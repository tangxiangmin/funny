import 'package:meta/meta.dart';
import 'dart:convert';

class _Author {
    final int uid;
    final String nickname;
    final String avatar;

    _Author({
        @required this.uid,
        @required this.nickname,
        @required this.avatar,
    });

//    static _Author fromJson(Map<String, dynamic> json) {
//        return _Author(
//            uid: json['uid'],
//            nickname: json['nickname'],
//            avatar: json['avatar'],
//        );
//    }
    factory _Author.fromJson(Map<String, dynamic> json){
        return _Author(
            uid: json['uid'],
            nickname: json['nickname'],
            avatar: json['avatar'],
        );
    }
}

class _Joke {
    final String content;
    final String img;

    _Joke({
        @required this.content,
        @required this.img,
    });

//    static _Joke fromJson(Map<String, dynamic> json) {
//        return _Joke(
//            content: json['content'],
//            img: json['img'],
//        );
//    }
    factory _Joke.fromJson(Map<String, dynamic> json){
        return _Joke(
            content: json['content'],
            img: json['img'],
        );
    }


}

class JokeModel {
    final _Author author;
    final _Joke joke;
    final int likeNum;
    final int dislikeNum;
    final int commentNum;
    final int id;

    JokeModel({
        @required this.id,
        @required this.author,
        @required this.joke,
        @required this.likeNum,
        @required this.dislikeNum,
        @required this.commentNum,
    });

    static List<JokeModel> fromJson(String data) {
        return json.decode(data)['data']
            .map<JokeModel>((obj) => JokeModel.fromMap(obj))
            .toList();
    }

    static JokeModel fromMap(Map map) {
        return new JokeModel(
            id: map['id'],
            author: _Author.fromJson(map['author']),
            joke: _Joke.fromJson(map['joke']),
            likeNum: map['likeNum'],
            dislikeNum: map['dislikeNum'],
            commentNum: map['commentNum'],
        );
    }
}