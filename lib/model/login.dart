import 'package:json_annotation/json_annotation.dart'; 
  
part 'login.g.dart';


@JsonSerializable()
  class login extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  Data data;

  login(this.code,this.message,this.data,);

  factory login.fromJson(Map<String, dynamic> srcJson) => _$loginFromJson(srcJson);

  Map<String, dynamic> toJson() => _$loginToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'uid')
  int uid;

  Data(this.token,this.uid,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
