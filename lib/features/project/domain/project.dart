import 'package:flutter/foundation.dart';

class Project {
  Project({
    required Map<String, String> title,
    required Map<String, String> description,
    this.link,
    this.imageUrl,
    int sortOrder = 0,
  })  : title = Map.unmodifiable(title),
        description = Map.unmodifiable(description),
        sortOrder = sortOrder;

  final Map<String, String> title;
  final Map<String, String> description;
  final String? link;
  final String? imageUrl;
  final int sortOrder;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        title: Map<String, String>.from(json['title'] ?? const {}),
        description: Map<String, String>.from(json['description'] ?? const {}),
        link: json['link'] as String?,
        imageUrl: json['image_url'] as String?,
        sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'title': Map<String, String>.from(title),
        'description': Map<String, String>.from(description),
        'link': link,
        'image_url': imageUrl,
        'sort_order': sortOrder,
      };

  Project copyWith({
    Map<String, String>? title,
    Map<String, String>? description,
    String? link,
    String? imageUrl,
    int? sortOrder,
  }) {
    return Project(
      title: title ?? this.title,
      description: description ?? this.description,
      link: link ?? this.link,
      imageUrl: imageUrl ?? this.imageUrl,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Project &&
        mapEquals(other.title, title) &&
        mapEquals(other.description, description) &&
        other.link == link &&
        other.imageUrl == imageUrl &&
        other.sortOrder == sortOrder;
  }

  @override
  int get hashCode => Object.hash(
        Object.hashAll(title.entries),
        Object.hashAll(description.entries),
        link,
        imageUrl,
        sortOrder,
      );
}
