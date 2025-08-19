import 'package:freezed_annotation/freezed_annotation.dart';

part 'testimony.freezed.dart';
part 'testimony.g.dart';

@freezed
class Testimony with _$Testimony {
  const factory Testimony({
    String? id,
    required String name,
    required String text,
    required String link,
    required String avatar,
  }) = _Testimony;
  factory Testimony.fromJson(Map<String, dynamic> json) =>
      _$TestimonyFromJson(json);
}
