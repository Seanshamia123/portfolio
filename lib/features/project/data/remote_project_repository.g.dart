// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_project_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectsRepositoryHash() =>
    r'b022ed7a2ce45bab2b1d1f870b21e5b533bd81ff';

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
String _$getProjectsHash() => r'3f237e50e91b8ad8fc38c8b3750ddb85815cf381';

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
