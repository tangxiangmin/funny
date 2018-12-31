import 'package:json_annotation/json_annotation.dart'; 
  
part 'joke_list.g.dart';


@JsonSerializable()
  class joke_list extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<Data> data;

  joke_list(this.code,this.message,this.data,);

  factory joke_list.fromJson(Map<String, dynamic> srcJson) => _$joke_listFromJson(srcJson);

  Map<String, dynamic> toJson() => _$joke_listToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'author')
  Author author;

  @JsonKey(name: 'joke')
  Joke joke;

  @JsonKey(name: 'likeNum')
  int likeNum;

  @JsonKey(name: 'dislikeNum')
  int dislikeNum;

  @JsonKey(name: 'commentNum')
  int commentNum;

  Data(this.id,this.author,this.joke,this.likeNum,this.dislikeNum,this.commentNum,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable()
  class Author extends Object {

  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  Author(this.uid,this.nickname,this.avatar,);

  factory Author.fromJson(Map<String, dynamic> srcJson) => _$AuthorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

}

  
@JsonSerializable()
  class Joke extends Object {

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'image')
  String image;

  Joke(this.content,this.image,);

  factory Joke.fromJson(Map<String, dynamic> srcJson) => _$JokeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$JokeToJson(this);

}

  
