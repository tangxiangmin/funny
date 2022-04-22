// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

user_info _$user_infoFromJson(Map<String, dynamic> json) {
  return user_info(
      json['code'] as int,
      json['message'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$user_infoToJson(user_info instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['uid'] as int,
      json['nickname'] as String,
      json['avatar'] as String,
      json['likeNum'] as int,
      json['fansNum'] as int,
      json['focusNum'] as int);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'likeNum': instance.likeNum,
      'fansNum': instance.fansNum,
      'focusNum': instance.focusNum
    };
