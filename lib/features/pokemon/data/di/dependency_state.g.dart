// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependency_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonServiceHash() => r'24783b20ea568b78ddbb360d504ab4c82930b2d1';

/// See also [pokemonService].
@ProviderFor(pokemonService)
final pokemonServiceProvider = Provider<PokemonServiceClient>.internal(
  pokemonService,
  name: r'pokemonServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PokemonServiceRef = ProviderRef<PokemonServiceClient>;
String _$pokemonRepositoryHash() => r'4a868b9db38f9b04014cab4f55d31a2fcf3b5d85';

/// See also [pokemonRepository].
@ProviderFor(pokemonRepository)
final pokemonRepositoryProvider = AutoDisposeProvider<PokemonRepo>.internal(
  pokemonRepository,
  name: r'pokemonRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PokemonRepositoryRef = AutoDisposeProviderRef<PokemonRepo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
