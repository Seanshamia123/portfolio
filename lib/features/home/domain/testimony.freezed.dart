// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'testimony.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Testimony {
  String? get id;
  String get name;
  String get text;
  String get link;
  String get avatar;

  /// Create a copy of Testimony
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TestimonyCopyWith<Testimony> get copyWith =>
      _$TestimonyCopyWithImpl<Testimony>(this as Testimony, _$identity);

  /// Serializes this Testimony to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Testimony &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, text, link, avatar);

  @override
  String toString() {
    return 'Testimony(id: $id, name: $name, text: $text, link: $link, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class $TestimonyCopyWith<$Res> {
  factory $TestimonyCopyWith(Testimony value, $Res Function(Testimony) _then) =
      _$TestimonyCopyWithImpl;
  @useResult
  $Res call({String? id, String name, String text, String link, String avatar});
}

/// @nodoc
class _$TestimonyCopyWithImpl<$Res> implements $TestimonyCopyWith<$Res> {
  _$TestimonyCopyWithImpl(this._self, this._then);

  final Testimony _self;
  final $Res Function(Testimony) _then;

  /// Create a copy of Testimony
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? text = null,
    Object? link = null,
    Object? avatar = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Testimony implements Testimony {
  const _Testimony(
      {this.id,
      required this.name,
      required this.text,
      required this.link,
      required this.avatar});
  factory _Testimony.fromJson(Map<String, dynamic> json) =>
      _$TestimonyFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String text;
  @override
  final String link;
  @override
  final String avatar;

  /// Create a copy of Testimony
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TestimonyCopyWith<_Testimony> get copyWith =>
      __$TestimonyCopyWithImpl<_Testimony>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TestimonyToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Testimony &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, text, link, avatar);

  @override
  String toString() {
    return 'Testimony(id: $id, name: $name, text: $text, link: $link, avatar: $avatar)';
  }
}

/// @nodoc
abstract mixin class _$TestimonyCopyWith<$Res>
    implements $TestimonyCopyWith<$Res> {
  factory _$TestimonyCopyWith(
          _Testimony value, $Res Function(_Testimony) _then) =
      __$TestimonyCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, String name, String text, String link, String avatar});
}

/// @nodoc
class __$TestimonyCopyWithImpl<$Res> implements _$TestimonyCopyWith<$Res> {
  __$TestimonyCopyWithImpl(this._self, this._then);

  final _Testimony _self;
  final $Res Function(_Testimony) _then;

  /// Create a copy of Testimony
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? text = null,
    Object? link = null,
    Object? avatar = null,
  }) {
    return _then(_Testimony(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
