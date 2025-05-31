// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_project_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectsRepositoryHash() =>
    r'c63361db7c2c7f40cf3b26315491e4938cd96d4d';

/// See also [projectsRepository].
@ProviderFor(projectsRepository)
final projectsRepositoryProvider = Provider<RemoteProjectRepository>.internal(
  projectsRepository,
  name: r'projectsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProjectsRepositoryRef = ProviderRef<RemoteProjectRepository>;
String _$getProjectsHash() => r'3ee2308aff28b9017cbdf6c5d16123a03066e44f';

/// See also [getProjects].
@ProviderFor(getProjects)
final getProjectsProvider = FutureProvider<List<Project>>.internal(
  getProjects,
  name: r'getProjectsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getProjectsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetProjectsRef = FutureProviderRef<List<Project>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
