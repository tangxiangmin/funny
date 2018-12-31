// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

joke_list _$joke_listFromJson(Map<String, dynamic> json) {
  return joke_list(
      json['code'] as int,
      json['message'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$joke_listToJson(joke_list instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['id'] as int,
      json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      json['joke'] == null
          ? null
          : Joke.fromJson(json['joke'] as Map<String, dynamic>),
      json['likeNum'] as int,
      json['dislikeNum'] as int,
      json['commentNum'] as int);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'joke': instance.joke,
      'likeNum': instance.likeNum,
      'dislikeNum': instance.dislikeNum,
      'commentNum': instance.commentNum
    };

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
      json['uid'] as int, json['nickname'] as String, json['avatar'] as String);
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      'avatar': instance.avatar
    };

Joke _$JokeFromJson(Map<String, dynamic> json) {
  return Joke(json['content'] as String, json['image'] as String);
}

Map<String, dynamic> _$JokeToJson(Joke instance) =>
    <String, dynamic>{'content': instance.content, 'image': instance.image};
