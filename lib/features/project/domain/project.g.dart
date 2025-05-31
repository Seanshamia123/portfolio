// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
      id: json['id'] as String?,
      title: Map<String, String>.from(json['title'] as Map),
      description: Map<String, String>.from(json['description'] as Map),
      link: json['link'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'link': instance.link,
      'image_url': instance.imageUrl,
    };
