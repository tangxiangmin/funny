import 'package:meta/meta.dart';
import 'dart:convert';

class _Author {
    final String uid;
    final String nickname;
    final String avatar;

    _Author({
        @required this.uid,
        @required this.nickname,
        @required this.avatar,
    });

    static _Author fromJson(Map<String, dynamic> json) {
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

    static _Joke fromJson(Map<String, dynamic> json) {
        return _Joke(
            content: json['content'],
            img: json['img'],
        );
    }
}

class JokeModel {
    final _Author author;
    final _Joke joke;
    final String likeNum;
    final String dislikeNum;
    final String commentNum;

    JokeModel({
        @required this.author,
        @required this.joke,
        @required this.likeNum,
        @required this.dislikeNum,
        @required this.commentNum,
    });

    static List<JokeModel> fromJson(String json) {
        return JSON.decode(json)['data']
            .map((obj) => JokeModel.fromMap(obj))
            .toList();
    }

    static JokeModel fromMap(Map map) {
        return new JokeModel(
            author: _Author.fromJson(map['author']),
            joke: _Joke.fromJson(map['joke']),
            likeNum: map['likeNum'],
            dislikeNum: map['dislikeNum'],
            commentNum: map['commentNum'],
        );
    }
}