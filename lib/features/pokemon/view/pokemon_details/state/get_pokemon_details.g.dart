// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pokemon_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPokemonDetailsDataHash() =>
    r'487070de499389ba3f38f3fb53c6343aad66510d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getPokemonDetailsData].
@ProviderFor(getPokemonDetailsData)
const getPokemonDetailsDataProvider = GetPokemonDetailsDataFamily();

/// See also [getPokemonDetailsData].
class GetPokemonDetailsDataFamily extends Family<AsyncValue<void>> {
  /// See also [getPokemonDetailsData].
  const GetPokemonDetailsDataFamily();

  /// See also [getPokemonDetailsData].
  GetPokemonDetailsDataProvider call(PokemonDetailsParams params) {
    return GetPokemonDetailsDataProvider(params);
  }

  @override
  GetPokemonDetailsDataProvider getProviderOverride(
    covariant GetPokemonDetailsDataProvider provider,
  ) {
    return call(provider.params);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getPokemonDetailsDataProvider';
}

/// See also [getPokemonDetailsData].
class GetPokemonDetailsDataProvider extends AutoDisposeFutureProvider<void> {
  /// See also [getPokemonDetailsData].
  GetPokemonDetailsDataProvider(PokemonDetailsParams params)
    : this._internal(
        (ref) => getPokemonDetailsData(ref as GetPokemonDetailsDataRef, params),
        from: getPokemonDetailsDataProvider,
        name: r'getPokemonDetailsDataProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$getPokemonDetailsDataHash,
        dependencies: GetPokemonDetailsDataFamily._dependencies,
        allTransitiveDependencies:
            GetPokemonDetailsDataFamily._allTransitiveDependencies,
        params: params,
      );

  GetPokemonDetailsDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final PokemonDetailsParams params;

  @override
  Override overrideWith(
    FutureOr<void> Function(GetPokemonDetailsDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPokemonDetailsDataProvider._internal(
        (ref) => create(ref as GetPokemonDetailsDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _GetPokemonDetailsDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPokemonDetailsDataProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetPokemonDetailsDataRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `params` of this provider.
  PokemonDetailsParams get params;
}

class _GetPokemonDetailsDataProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with GetPokemonDetailsDataRef {
  _GetPokemonDetailsDataProviderElement(super.provider);

  @override
  PokemonDetailsParams get params =>
      (origin as GetPokemonDetailsDataProvider).params;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
