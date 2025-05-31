// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Project {
  String? get id;
  Map<String, String> get title;
  Map<String, String> get description;
  String? get link; // Make nullable
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<Project> get copyWith =>
      _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Project &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      link,
      imageUrl);

  @override
  String toString() {
    return 'Project(id: $id, title: $title, description: $description, link: $link, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) =
      _$ProjectCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      Map<String, String> title,
      Map<String, String> description,
      String? link,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? link = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Project implements Project {
  const _Project(
      {this.id,
      required final Map<String, String> title,
      required final Map<String, String> description,
      this.link,
      @JsonKey(name: 'image_url') this.imageUrl})
      : _title = title,
        _description = description;
  factory _Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  @override
  final String? id;
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

  @override
  final String? link;
// Make nullable
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProjectCopyWith<_Project> get copyWith =>
      __$ProjectCopyWithImpl<_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProjectToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Project &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._title, _title) &&
            const DeepCollectionEquality()
                .equals(other._description, _description) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_title),
      const DeepCollectionEquality().hash(_description),
      link,
      imageUrl);

  @override
  String toString() {
    return 'Project(id: $id, title: $title, description: $description, link: $link, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) =
      __$ProjectCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      Map<String, String> title,
      Map<String, String> description,
      String? link,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class __$ProjectCopyWithImpl<$Res> implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

  /// Create a copy of Project
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? link = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_Project(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _self._title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      description: null == description
          ? _self._description
          : description // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      link: freezed == link
          ? _self.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
