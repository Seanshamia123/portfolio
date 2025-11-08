// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_experiences_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$experiencesRepositoryHash() =>
    r'aa377889d73d6c21d548fd6e0f7d544a359136da';

/// See also [experiencesRepository].
@ProviderFor(experiencesRepository)
final experiencesRepositoryProvider =
    Provider<RemoteExperiencesRepository>.internal(
  experiencesRepository,
  name: r'experiencesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$experiencesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExperiencesRepositoryRef = ProviderRef<RemoteExperiencesRepository>;
String _$getExperiencesHash() => r'b8f9cc766bc100068ded477a2f87b20cbae60e10';

/// See also [getExperiences].
@ProviderFor(getExperiences)
final getExperiencesProvider = FutureProvider<List<Experience>>.internal(
  getExperiences,
  name: r'getExperiencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getExperiencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetExperiencesRef = FutureProviderRef<List<Experience>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
