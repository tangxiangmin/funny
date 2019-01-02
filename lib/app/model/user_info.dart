import 'package:json_annotation/json_annotation.dart'; 
  
part 'user_info.g.dart';


@JsonSerializable()
  class user_info extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  user_info(this.code,this.message,this.data,);

  factory user_info.fromJson(Map<String, dynamic> srcJson) => _$user_infoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$user_infoToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'likeNum')
  int likeNum;

  @JsonKey(name: 'fansNum')
  int fansNum;

  @JsonKey(name: 'focusNum')
  int focusNum;

  Data(this.uid,this.nickname,this.avatar,this.likeNum,this.fansNum,this.focusNum,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
