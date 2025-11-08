class Testimony {
  const Testimony({
    this.id,
    required this.name,
    required this.text,
    required this.link,
    required this.avatar,
  });

  final String? id;
  final String name;
  final String text;
  final String link;
  final String avatar;

  factory Testimony.fromJson(Map<String, dynamic> json) => Testimony(
        id: json['id'] as String?,
        name: (json['name'] as String?) ?? '',
        text: (json['text'] as String?) ?? '',
        link: (json['link'] as String?) ?? '',
        avatar: (json['avatar'] as String?) ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'text': text,
        'link': link,
        'avatar': avatar,
      };

  Testimony copyWith({
    String? id,
    String? name,
    String? text,
    String? link,
    String? avatar,
  }) {
    return Testimony(
      id: id ?? this.id,
      name: name ?? this.name,
      text: text ?? this.text,
      link: link ?? this.link,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Testimony &&
        other.id == id &&
        other.name == name &&
        other.text == text &&
        other.link == link &&
        other.avatar == avatar;
  }

  @override
  int get hashCode => Object.hash(id, name, text, link, avatar);
}
