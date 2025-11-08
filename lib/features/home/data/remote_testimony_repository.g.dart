// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_testimony_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$testimonyRepositoryHash() =>
    r'4ef4e221c065cd729b52d0e5b787ae7e2f01c8ab';

/// See also [testimonyRepository].
@ProviderFor(testimonyRepository)
final testimonyRepositoryProvider =
    Provider<RemoteTestimonyRepository>.internal(
  testimonyRepository,
  name: r'testimonyRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testimonyRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TestimonyRepositoryRef = ProviderRef<RemoteTestimonyRepository>;
String _$getTestimoniesHash() => r'e79997405c526cc99cdbd4467770b7e2dd911cd9';

/// See also [getTestimonies].
@ProviderFor(getTestimonies)
final getTestimoniesProvider = FutureProvider<List<Testimony>>.internal(
  getTestimonies,
  name: r'getTestimoniesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTestimoniesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetTestimoniesRef = FutureProviderRef<List<Testimony>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
