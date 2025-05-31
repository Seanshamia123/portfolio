// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Experience {
  String? get id;
  String get link;
  Map<String, String> get title;
  Map<String, String> get description;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExperienceCopyWith<Experience> get copyWith =>
      _$ExperienceCopyWithImpl<Experience>(this as Experience, _$identity);

  /// Serializes this Experience to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Experience &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      link,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description));

  @override
  String toString() {
    return 'Experience(id: $id, link: $link, title: $title, description: $description)';
  }
}

/// @nodoc
abstract mixin class $ExperienceCopyWith<$Res> {
  factory $ExperienceCopyWith(
          Experience value, $Res Function(Experience) _then) =
      _$ExperienceCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String link,
      Map<String, String> title,
      Map<String, String> description});
}

/// @nodoc
class _$ExperienceCopyWithImpl<$Res> implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._self, this._then);

  final Experience _self;
  final $Res Function(Experience) _then;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? link = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Experience implements Experience {
  const _Experience(
      {this.id,
      required this.link,
      required final Map<String, String> title,
      required final Map<String, String> description})
      : _title = title,
        _description = description;
  factory _Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  @override
  final String? id;
  @override
  final String link;
  final Map<String, String> _title;
  @override
  Map<String, String> get title {
    if (_title is EqualUnmodifiableMapView) return _title;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_title);
  }

  final Map<String, String> _description;
  @override
  Map<String, String> get description {
    if (_description is EqualUnmodifiableMapView) return _description;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_description);
  }

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExperienceCopyWith<_Experience> get copyWith =>
      __$ExperienceCopyWithImpl<_Experience>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExperienceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Experience &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality().equals(other._title, _title) &&
            const DeepCollectionEquality()
                .equals(other._description, _description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      link,
      const DeepCollectionEquality().hash(_title),
      const DeepCollectionEquality().hash(_description));

  @override
  String toString() {
    return 'Experience(id: $id, link: $link, title: $title, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$ExperienceCopyWith<$Res>
    implements $ExperienceCopyWith<$Res> {
  factory _$ExperienceCopyWith(
          _Experience value, $Res Function(_Experience) _then) =
      __$ExperienceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String link,
      Map<String, String> title,
      Map<String, String> description});
}

/// @nodoc
class __$ExperienceCopyWithImpl<$Res> implements _$ExperienceCopyWith<$Res> {
  __$ExperienceCopyWithImpl(this._self, this._then);

  final _Experience _self;
  final $Res Function(_Experience) _then;

  /// Create a copy of Experience
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? link = null,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_Experience(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self._title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: null == description
          ? _self._description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

// dart format on
