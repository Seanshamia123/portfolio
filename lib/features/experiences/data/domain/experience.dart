import 'package:flutter/foundation.dart';

class Experience {
  Experience({
    this.id,
    required this.link,
    required Map<String, String> title,
    required Map<String, String> description,
  })  : title = Map.unmodifiable(title),
        description = Map.unmodifiable(description);

  final String? id;
  final String link;
  final Map<String, String> title;
  final Map<String, String> description;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json['id'] as String?,
        link: (json['link'] as String?) ?? '',
        title: Map<String, String>.from(json['title'] ?? const {}),
        description: Map<String, String>.from(json['description'] ?? const {}),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'link': link,
        'title': Map<String, String>.from(title),
        'description': Map<String, String>.from(description),
      };

  Experience copyWith({
    String? id,
    String? link,
    Map<String, String>? title,
    Map<String, String>? description,
  }) {
    return Experience(
      id: id ?? this.id,
      link: link ?? this.link,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Experience &&
        other.id == id &&
        other.link == link &&
        mapEquals(other.title, title) &&
        mapEquals(other.description, description);
  }

  @override
  int get hashCode => Object.hash(
        id,
        link,
        Object.hashAll(title.entries),
        Object.hashAll(description.entries),
      );
}
