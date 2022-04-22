// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

login _$loginFromJson(Map<String, dynamic> json) {
  return login(
      json['code'] as int,
      json['message'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$loginToJson(login instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(json['token'] as String, json['uid'] as int);
}

Map<String, dynamic> _$DataToJson(Data instance) =>
    <String, dynamic>{'token': instance.token, 'uid': instance.uid};
