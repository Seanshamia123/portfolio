// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimony.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Testimony _$TestimonyFromJson(Map<String, dynamic> json) => _Testimony(
      id: json['id'] as String?,
      name: json['name'] as String,
      text: json['text'] as String,
      link: json['link'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$TestimonyToJson(_Testimony instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'link': instance.link,
      'avatar': instance.avatar,
    };
