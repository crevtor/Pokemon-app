// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonListNotifierHash() =>
    r'cda212ac9984001788b63b94d922073be226abe8';

/// See also [PokemonListNotifier].
@ProviderFor(PokemonListNotifier)
final pokemonListNotifierProvider =
    AutoDisposeAsyncNotifierProvider<PokemonListNotifier, void>.internal(
      PokemonListNotifier.new,
      name: r'pokemonListNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$pokemonListNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PokemonListNotifier = AutoDisposeAsyncNotifier<void>;
String _$pokemonListFiltersHash() =>
    r'0d695e3f09cfb509c5940ff7a5d379f09b10422b';

/// See also [PokemonListFilters].
@ProviderFor(PokemonListFilters)
final pokemonListFiltersProvider =
    AutoDisposeNotifierProvider<PokemonListFilters, PokemonQuery>.internal(
      PokemonListFilters.new,
      name: r'pokemonListFiltersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$pokemonListFiltersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PokemonListFilters = AutoDisposeNotifier<PokemonQuery>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
