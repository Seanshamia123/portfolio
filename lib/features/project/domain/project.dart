import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    String? id,
    required Map<String, String> title,
    required Map<String, String> description,
    String? link, // Make nullable
    @JsonKey(name: 'image_url') String? imageUrl, // Make nullable
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  factory Project.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Project.fromJson(doc.data()).copyWith(id: doc.id);
  }
}
