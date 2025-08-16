import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

@freezed
class Experience with _$Experience {
  const factory Experience({
    String? id,
    required String link,
    required Map<String, String> title,
    required Map<String, String> description,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  factory Experience.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
      Experience.fromJson(doc.data()).copyWith(id: doc.id);
}
