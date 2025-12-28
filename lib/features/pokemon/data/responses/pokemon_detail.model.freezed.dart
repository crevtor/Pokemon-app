// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AbilitySlot {

 NamedUrl? get ability;
/// Create a copy of AbilitySlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbilitySlotCopyWith<AbilitySlot> get copyWith => _$AbilitySlotCopyWithImpl<AbilitySlot>(this as AbilitySlot, _$identity);

  /// Serializes this AbilitySlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbilitySlot&&(identical(other.ability, ability) || other.ability == ability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ability);

@override
String toString() {
  return 'AbilitySlot(ability: $ability)';
}


}

/// @nodoc
abstract mixin class $AbilitySlotCopyWith<$Res>  {
  factory $AbilitySlotCopyWith(AbilitySlot value, $Res Function(AbilitySlot) _then) = _$AbilitySlotCopyWithImpl;
@useResult
$Res call({
 NamedUrl? ability
});


$NamedUrlCopyWith<$Res>? get ability;

}
/// @nodoc
class _$AbilitySlotCopyWithImpl<$Res>
    implements $AbilitySlotCopyWith<$Res> {
  _$AbilitySlotCopyWithImpl(this._self, this._then);

  final AbilitySlot _self;
  final $Res Function(AbilitySlot) _then;

/// Create a copy of AbilitySlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ability = freezed,}) {
  return _then(_self.copyWith(
ability: freezed == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as NamedUrl?,
  ));
}
/// Create a copy of AbilitySlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedUrlCopyWith<$Res>? get ability {
    if (_self.ability == null) {
    return null;
  }

  return $NamedUrlCopyWith<$Res>(_self.ability!, (value) {
    return _then(_self.copyWith(ability: value));
  });
}
}


/// Adds pattern-matching-related methods to [AbilitySlot].
extension AbilitySlotPatterns on AbilitySlot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AbilitySlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AbilitySlot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AbilitySlot value)  $default,){
final _that = this;
switch (_that) {
case _AbilitySlot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AbilitySlot value)?  $default,){
final _that = this;
switch (_that) {
case _AbilitySlot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NamedUrl? ability)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AbilitySlot() when $default != null:
return $default(_that.ability);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NamedUrl? ability)  $default,) {final _that = this;
switch (_that) {
case _AbilitySlot():
return $default(_that.ability);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NamedUrl? ability)?  $default,) {final _that = this;
switch (_that) {
case _AbilitySlot() when $default != null:
return $default(_that.ability);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AbilitySlot implements AbilitySlot {
  const _AbilitySlot({this.ability});
  factory _AbilitySlot.fromJson(Map<String, dynamic> json) => _$AbilitySlotFromJson(json);

@override final  NamedUrl? ability;

/// Create a copy of AbilitySlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AbilitySlotCopyWith<_AbilitySlot> get copyWith => __$AbilitySlotCopyWithImpl<_AbilitySlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AbilitySlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AbilitySlot&&(identical(other.ability, ability) || other.ability == ability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ability);

@override
String toString() {
  return 'AbilitySlot(ability: $ability)';
}


}

/// @nodoc
abstract mixin class _$AbilitySlotCopyWith<$Res> implements $AbilitySlotCopyWith<$Res> {
  factory _$AbilitySlotCopyWith(_AbilitySlot value, $Res Function(_AbilitySlot) _then) = __$AbilitySlotCopyWithImpl;
@override @useResult
$Res call({
 NamedUrl? ability
});


@override $NamedUrlCopyWith<$Res>? get ability;

}
/// @nodoc
class __$AbilitySlotCopyWithImpl<$Res>
    implements _$AbilitySlotCopyWith<$Res> {
  __$AbilitySlotCopyWithImpl(this._self, this._then);

  final _AbilitySlot _self;
  final $Res Function(_AbilitySlot) _then;

/// Create a copy of AbilitySlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ability = freezed,}) {
  return _then(_AbilitySlot(
ability: freezed == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as NamedUrl?,
  ));
}

/// Create a copy of AbilitySlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedUrlCopyWith<$Res>? get ability {
    if (_self.ability == null) {
    return null;
  }

  return $NamedUrlCopyWith<$Res>(_self.ability!, (value) {
    return _then(_self.copyWith(ability: value));
  });
}
}


/// @nodoc
mixin _$NamedUrl {

 String? get name; String? get url;
/// Create a copy of NamedUrl
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NamedUrlCopyWith<NamedUrl> get copyWith => _$NamedUrlCopyWithImpl<NamedUrl>(this as NamedUrl, _$identity);

  /// Serializes this NamedUrl to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NamedUrl&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'NamedUrl(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $NamedUrlCopyWith<$Res>  {
  factory $NamedUrlCopyWith(NamedUrl value, $Res Function(NamedUrl) _then) = _$NamedUrlCopyWithImpl;
@useResult
$Res call({
 String? name, String? url
});




}
/// @nodoc
class _$NamedUrlCopyWithImpl<$Res>
    implements $NamedUrlCopyWith<$Res> {
  _$NamedUrlCopyWithImpl(this._self, this._then);

  final NamedUrl _self;
  final $Res Function(NamedUrl) _then;

/// Create a copy of NamedUrl
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NamedUrl].
extension NamedUrlPatterns on NamedUrl {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NamedUrl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NamedUrl() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NamedUrl value)  $default,){
final _that = this;
switch (_that) {
case _NamedUrl():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NamedUrl value)?  $default,){
final _that = this;
switch (_that) {
case _NamedUrl() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NamedUrl() when $default != null:
return $default(_that.name,_that.url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? url)  $default,) {final _that = this;
switch (_that) {
case _NamedUrl():
return $default(_that.name,_that.url);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _NamedUrl() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NamedUrl implements NamedUrl {
  const _NamedUrl({required this.name, required this.url});
  factory _NamedUrl.fromJson(Map<String, dynamic> json) => _$NamedUrlFromJson(json);

@override final  String? name;
@override final  String? url;

/// Create a copy of NamedUrl
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NamedUrlCopyWith<_NamedUrl> get copyWith => __$NamedUrlCopyWithImpl<_NamedUrl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NamedUrlToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NamedUrl&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'NamedUrl(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$NamedUrlCopyWith<$Res> implements $NamedUrlCopyWith<$Res> {
  factory _$NamedUrlCopyWith(_NamedUrl value, $Res Function(_NamedUrl) _then) = __$NamedUrlCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? url
});




}
/// @nodoc
class __$NamedUrlCopyWithImpl<$Res>
    implements _$NamedUrlCopyWith<$Res> {
  __$NamedUrlCopyWithImpl(this._self, this._then);

  final _NamedUrl _self;
  final $Res Function(_NamedUrl) _then;

/// Create a copy of NamedUrl
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? url = freezed,}) {
  return _then(_NamedUrl(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Cries {

 String? get latest; String? get legacy;
/// Create a copy of Cries
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CriesCopyWith<Cries> get copyWith => _$CriesCopyWithImpl<Cries>(this as Cries, _$identity);

  /// Serializes this Cries to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cries&&(identical(other.latest, latest) || other.latest == latest)&&(identical(other.legacy, legacy) || other.legacy == legacy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latest,legacy);

@override
String toString() {
  return 'Cries(latest: $latest, legacy: $legacy)';
}


}

/// @nodoc
abstract mixin class $CriesCopyWith<$Res>  {
  factory $CriesCopyWith(Cries value, $Res Function(Cries) _then) = _$CriesCopyWithImpl;
@useResult
$Res call({
 String? latest, String? legacy
});




}
/// @nodoc
class _$CriesCopyWithImpl<$Res>
    implements $CriesCopyWith<$Res> {
  _$CriesCopyWithImpl(this._self, this._then);

  final Cries _self;
  final $Res Function(Cries) _then;

/// Create a copy of Cries
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latest = freezed,Object? legacy = freezed,}) {
  return _then(_self.copyWith(
latest: freezed == latest ? _self.latest : latest // ignore: cast_nullable_to_non_nullable
as String?,legacy: freezed == legacy ? _self.legacy : legacy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Cries].
extension CriesPatterns on Cries {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cries value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cries() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cries value)  $default,){
final _that = this;
switch (_that) {
case _Cries():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cries value)?  $default,){
final _that = this;
switch (_that) {
case _Cries() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? latest,  String? legacy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cries() when $default != null:
return $default(_that.latest,_that.legacy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? latest,  String? legacy)  $default,) {final _that = this;
switch (_that) {
case _Cries():
return $default(_that.latest,_that.legacy);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? latest,  String? legacy)?  $default,) {final _that = this;
switch (_that) {
case _Cries() when $default != null:
return $default(_that.latest,_that.legacy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cries implements Cries {
  const _Cries({this.latest, this.legacy});
  factory _Cries.fromJson(Map<String, dynamic> json) => _$CriesFromJson(json);

@override final  String? latest;
@override final  String? legacy;

/// Create a copy of Cries
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CriesCopyWith<_Cries> get copyWith => __$CriesCopyWithImpl<_Cries>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CriesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cries&&(identical(other.latest, latest) || other.latest == latest)&&(identical(other.legacy, legacy) || other.legacy == legacy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latest,legacy);

@override
String toString() {
  return 'Cries(latest: $latest, legacy: $legacy)';
}


}

/// @nodoc
abstract mixin class _$CriesCopyWith<$Res> implements $CriesCopyWith<$Res> {
  factory _$CriesCopyWith(_Cries value, $Res Function(_Cries) _then) = __$CriesCopyWithImpl;
@override @useResult
$Res call({
 String? latest, String? legacy
});




}
/// @nodoc
class __$CriesCopyWithImpl<$Res>
    implements _$CriesCopyWith<$Res> {
  __$CriesCopyWithImpl(this._self, this._then);

  final _Cries _self;
  final $Res Function(_Cries) _then;

/// Create a copy of Cries
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latest = freezed,Object? legacy = freezed,}) {
  return _then(_Cries(
latest: freezed == latest ? _self.latest : latest // ignore: cast_nullable_to_non_nullable
as String?,legacy: freezed == legacy ? _self.legacy : legacy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GameIndex {

 int? get gameIndex; NamedUrl? get version;
/// Create a copy of GameIndex
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameIndexCopyWith<GameIndex> get copyWith => _$GameIndexCopyWithImpl<GameIndex>(this as GameIndex, _$identity);

  /// Serializes this GameIndex to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameIndex&&(identical(other.gameIndex, gameIndex) || other.gameIndex == gameIndex)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameIndex,version);

@override
String toString() {
  return 'GameIndex(gameIndex: $gameIndex, version: $version)';
}


}

/// @nodoc
abstract mixin class $GameIndexCopyWith<$Res>  {
  factory $GameIndexCopyWith(GameIndex value, $Res Function(GameIndex) _then) = _$GameIndexCopyWithImpl;
@useResult
$Res call({
 int? gameIndex, NamedUrl? version
});


$NamedUrlCopyWith<$Res>? get version;

}
/// @nodoc
class _$GameIndexCopyWithImpl<$Res>
    implements $GameIndexCopyWith<$Res> {
  _$GameIndexCopyWithImpl(this._self, this._then);

  final GameIndex _self;
  final $Res Function(GameIndex) _then;

/// Create a copy of GameIndex
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gameIndex = freezed,Object? version = freezed,}) {
  return _then(_self.copyWith(
gameIndex: freezed == gameIndex ? _self.gameIndex : gameIndex // ignore: cast_nullable_to_non_nullable
as int?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as NamedUrl?,
  ));
}
/// Create a copy of GameIndex
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedUrlCopyWith<$Res>? get version {
    if (_self.version == null) {
    return null;
  }

  return $NamedUrlCopyWith<$Res>(_self.version!, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameIndex].
extension GameIndexPatterns on GameIndex {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameIndex value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameIndex() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameIndex value)  $default,){
final _that = this;
switch (_that) {
case _GameIndex():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameIndex value)?  $default,){
final _that = this;
switch (_that) {
case _GameIndex() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? gameIndex,  NamedUrl? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameIndex() when $default != null:
return $default(_that.gameIndex,_that.version);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? gameIndex,  NamedUrl? version)  $default,) {final _that = this;
switch (_that) {
case _GameIndex():
return $default(_that.gameIndex,_that.version);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? gameIndex,  NamedUrl? version)?  $default,) {final _that = this;
switch (_that) {
case _GameIndex() when $default != null:
return $default(_that.gameIndex,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameIndex implements GameIndex {
  const _GameIndex({this.gameIndex, this.version});
  factory _GameIndex.fromJson(Map<String, dynamic> json) => _$GameIndexFromJson(json);

@override final  int? gameIndex;
@override final  NamedUrl? version;

/// Create a copy of GameIndex
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameIndexCopyWith<_GameIndex> get copyWith => __$GameIndexCopyWithImpl<_GameIndex>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameIndexToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameIndex&&(identical(other.gameIndex, gameIndex) || other.gameIndex == gameIndex)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gameIndex,version);

@override
String toString() {
  return 'GameIndex(gameIndex: $gameIndex, version: $version)';
}


}

/// @nodoc
abstract mixin class _$GameIndexCopyWith<$Res> implements $GameIndexCopyWith<$Res> {
  factory _$GameIndexCopyWith(_GameIndex value, $Res Function(_GameIndex) _then) = __$GameIndexCopyWithImpl;
@override @useResult
$Res call({
 int? gameIndex, NamedUrl? version
});


@override $NamedUrlCopyWith<$Res>? get version;

}
/// @nodoc
class __$GameIndexCopyWithImpl<$Res>
    implements _$GameIndexCopyWith<$Res> {
  __$GameIndexCopyWithImpl(this._self, this._then);

  final _GameIndex _self;
  final $Res Function(_GameIndex) _then;

/// Create a copy of GameIndex
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gameIndex = freezed,Object? version = freezed,}) {
  return _then(_GameIndex(
gameIndex: freezed == gameIndex ? _self.gameIndex : gameIndex // ignore: cast_nullable_to_non_nullable
as int?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as NamedUrl?,
  ));
}

/// Create a copy of GameIndex
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedUrlCopyWith<$Res>? get version {
    if (_self.version == null) {
    return null;
  }

  return $NamedUrlCopyWith<$Res>(_self.version!, (value) {
    return _then(_self.copyWith(version: value));
  });
}
}


/// @nodoc
mixin _$Sprites {

 String? get backDefault; String? get backFemale; String? get backShiny; String? get backShinyFemale; String? get frontDefault; String? get frontFemale; String? get frontShiny;
/// Create a copy of Sprites
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpritesCopyWith<Sprites> get copyWith => _$SpritesCopyWithImpl<Sprites>(this as Sprites, _$identity);

  /// Serializes this Sprites to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sprites&&(identical(other.backDefault, backDefault) || other.backDefault == backDefault)&&(identical(other.backFemale, backFemale) || other.backFemale == backFemale)&&(identical(other.backShiny, backShiny) || other.backShiny == backShiny)&&(identical(other.backShinyFemale, backShinyFemale) || other.backShinyFemale == backShinyFemale)&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault)&&(identical(other.frontFemale, frontFemale) || other.frontFemale == frontFemale)&&(identical(other.frontShiny, frontShiny) || other.frontShiny == frontShiny));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,backDefault,backFemale,backShiny,backShinyFemale,frontDefault,frontFemale,frontShiny);

@override
String toString() {
  return 'Sprites(backDefault: $backDefault, backFemale: $backFemale, backShiny: $backShiny, backShinyFemale: $backShinyFemale, frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny)';
}


}

/// @nodoc
abstract mixin class $SpritesCopyWith<$Res>  {
  factory $SpritesCopyWith(Sprites value, $Res Function(Sprites) _then) = _$SpritesCopyWithImpl;
@useResult
$Res call({
 String? backDefault, String? backFemale, String? backShiny, String? backShinyFemale, String? frontDefault, String? frontFemale, String? frontShiny
});




}
/// @nodoc
class _$SpritesCopyWithImpl<$Res>
    implements $SpritesCopyWith<$Res> {
  _$SpritesCopyWithImpl(this._self, this._then);

  final Sprites _self;
  final $Res Function(Sprites) _then;

/// Create a copy of Sprites
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backDefault = freezed,Object? backFemale = freezed,Object? backShiny = freezed,Object? backShinyFemale = freezed,Object? frontDefault = freezed,Object? frontFemale = freezed,Object? frontShiny = freezed,}) {
  return _then(_self.copyWith(
backDefault: freezed == backDefault ? _self.backDefault : backDefault // ignore: cast_nullable_to_non_nullable
as String?,backFemale: freezed == backFemale ? _self.backFemale : backFemale // ignore: cast_nullable_to_non_nullable
as String?,backShiny: freezed == backShiny ? _self.backShiny : backShiny // ignore: cast_nullable_to_non_nullable
as String?,backShinyFemale: freezed == backShinyFemale ? _self.backShinyFemale : backShinyFemale // ignore: cast_nullable_to_non_nullable
as String?,frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,frontFemale: freezed == frontFemale ? _self.frontFemale : frontFemale // ignore: cast_nullable_to_non_nullable
as String?,frontShiny: freezed == frontShiny ? _self.frontShiny : frontShiny // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Sprites].
extension SpritesPatterns on Sprites {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sprites value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sprites() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sprites value)  $default,){
final _that = this;
switch (_that) {
case _Sprites():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sprites value)?  $default,){
final _that = this;
switch (_that) {
case _Sprites() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? backDefault,  String? backFemale,  String? backShiny,  String? backShinyFemale,  String? frontDefault,  String? frontFemale,  String? frontShiny)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sprites() when $default != null:
return $default(_that.backDefault,_that.backFemale,_that.backShiny,_that.backShinyFemale,_that.frontDefault,_that.frontFemale,_that.frontShiny);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? backDefault,  String? backFemale,  String? backShiny,  String? backShinyFemale,  String? frontDefault,  String? frontFemale,  String? frontShiny)  $default,) {final _that = this;
switch (_that) {
case _Sprites():
return $default(_that.backDefault,_that.backFemale,_that.backShiny,_that.backShinyFemale,_that.frontDefault,_that.frontFemale,_that.frontShiny);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? backDefault,  String? backFemale,  String? backShiny,  String? backShinyFemale,  String? frontDefault,  String? frontFemale,  String? frontShiny)?  $default,) {final _that = this;
switch (_that) {
case _Sprites() when $default != null:
return $default(_that.backDefault,_that.backFemale,_that.backShiny,_that.backShinyFemale,_that.frontDefault,_that.frontFemale,_that.frontShiny);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sprites implements Sprites {
  const _Sprites({this.backDefault, this.backFemale, this.backShiny, this.backShinyFemale, this.frontDefault, this.frontFemale, this.frontShiny});
  factory _Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);

@override final  String? backDefault;
@override final  String? backFemale;
@override final  String? backShiny;
@override final  String? backShinyFemale;
@override final  String? frontDefault;
@override final  String? frontFemale;
@override final  String? frontShiny;

/// Create a copy of Sprites
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpritesCopyWith<_Sprites> get copyWith => __$SpritesCopyWithImpl<_Sprites>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpritesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sprites&&(identical(other.backDefault, backDefault) || other.backDefault == backDefault)&&(identical(other.backFemale, backFemale) || other.backFemale == backFemale)&&(identical(other.backShiny, backShiny) || other.backShiny == backShiny)&&(identical(other.backShinyFemale, backShinyFemale) || other.backShinyFemale == backShinyFemale)&&(identical(other.frontDefault, frontDefault) || other.frontDefault == frontDefault)&&(identical(other.frontFemale, frontFemale) || other.frontFemale == frontFemale)&&(identical(other.frontShiny, frontShiny) || other.frontShiny == frontShiny));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,backDefault,backFemale,backShiny,backShinyFemale,frontDefault,frontFemale,frontShiny);

@override
String toString() {
  return 'Sprites(backDefault: $backDefault, backFemale: $backFemale, backShiny: $backShiny, backShinyFemale: $backShinyFemale, frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny)';
}


}

/// @nodoc
abstract mixin class _$SpritesCopyWith<$Res> implements $SpritesCopyWith<$Res> {
  factory _$SpritesCopyWith(_Sprites value, $Res Function(_Sprites) _then) = __$SpritesCopyWithImpl;
@override @useResult
$Res call({
 String? backDefault, String? backFemale, String? backShiny, String? backShinyFemale, String? frontDefault, String? frontFemale, String? frontShiny
});




}
/// @nodoc
class __$SpritesCopyWithImpl<$Res>
    implements _$SpritesCopyWith<$Res> {
  __$SpritesCopyWithImpl(this._self, this._then);

  final _Sprites _self;
  final $Res Function(_Sprites) _then;

/// Create a copy of Sprites
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backDefault = freezed,Object? backFemale = freezed,Object? backShiny = freezed,Object? backShinyFemale = freezed,Object? frontDefault = freezed,Object? frontFemale = freezed,Object? frontShiny = freezed,}) {
  return _then(_Sprites(
backDefault: freezed == backDefault ? _self.backDefault : backDefault // ignore: cast_nullable_to_non_nullable
as String?,backFemale: freezed == backFemale ? _self.backFemale : backFemale // ignore: cast_nullable_to_non_nullable
as String?,backShiny: freezed == backShiny ? _self.backShiny : backShiny // ignore: cast_nullable_to_non_nullable
as String?,backShinyFemale: freezed == backShinyFemale ? _self.backShinyFemale : backShinyFemale // ignore: cast_nullable_to_non_nullable
as String?,frontDefault: freezed == frontDefault ? _self.frontDefault : frontDefault // ignore: cast_nullable_to_non_nullable
as String?,frontFemale: freezed == frontFemale ? _self.frontFemale : frontFemale // ignore: cast_nullable_to_non_nullable
as String?,frontShiny: freezed == frontShiny ? _self.frontShiny : frontShiny // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TypeSlot {

 int? get slot; NamedUrl? get type;
/// Create a copy of TypeSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypeSlotCopyWith<TypeSlot> get copyWith => _$TypeSlotCopyWithImpl<TypeSlot>(this as TypeSlot, _$identity);

  /// Serializes this TypeSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypeSlot&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slot,type);

@override
String toString() {
  return 'TypeSlot(slot: $slot, type: $type)';
}


}

/// @nodoc
abstract mixin class $TypeSlotCopyWith<$Res>  {
  factory $TypeSlotCopyWith(TypeSlot value, $Res Function(TypeSlot) _then) = _$TypeSlotCopyWithImpl;
@useResult
$Res call({
 int? slot, NamedUrl? type
});


$NamedUrlCopyWith<$Res>? get type;

}
/// @nodoc
class _$TypeSlotCopyWithImpl<$Res>
    implements $TypeSlotCopyWith<$Res> {
  _$TypeSlotCopyWithImpl(this._self, this._then);

  final TypeSlot _self;
  final $Res Function(TypeSlot) _then;

/// Create a copy of TypeSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slot = freezed,Object? type = freezed,}) {
  return _then(_self.copyWith(
slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NamedUrl?,
  ));
}
/// Create a copy of TypeSlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedUrlCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $NamedUrlCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// Adds pattern-matching-related methods to [TypeSlot].
extension TypeSlotPatterns on TypeSlot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TypeSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TypeSlot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TypeSlot value)  $default,){
final _that = this;
switch (_that) {
case _TypeSlot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TypeSlot value)?  $default,){
final _that = this;
switch (_that) {
case _TypeSlot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? slot,  NamedUrl? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TypeSlot() when $default != null:
return $default(_that.slot,_that.type);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? slot,  NamedUrl? type)  $default,) {final _that = this;
switch (_that) {
case _TypeSlot():
return $default(_that.slot,_that.type);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? slot,  NamedUrl? type)?  $default,) {final _that = this;
switch (_that) {
case _TypeSlot() when $default != null:
return $default(_that.slot,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TypeSlot implements TypeSlot {
  const _TypeSlot({this.slot, this.type});
  factory _TypeSlot.fromJson(Map<String, dynamic> json) => _$TypeSlotFromJson(json);

@override final  int? slot;
@override final  NamedUrl? type;

/// Create a copy of TypeSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypeSlotCopyWith<_TypeSlot> get copyWith => __$TypeSlotCopyWithImpl<_TypeSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypeSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypeSlot&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slot,type);

@override
String toString() {
  return 'TypeSlot(slot: $slot, type: $type)';
}


}

/// @nodoc
abstract mixin class _$TypeSlotCopyWith<$Res> implements $TypeSlotCopyWith<$Res> {
  factory _$TypeSlotCopyWith(_TypeSlot value, $Res Function(_TypeSlot) _then) = __$TypeSlotCopyWithImpl;
@override @useResult
$Res call({
 int? slot, NamedUrl? type
});


@override $NamedUrlCopyWith<$Res>? get type;

}
/// @nodoc
class __$TypeSlotCopyWithImpl<$Res>
    implements _$TypeSlotCopyWith<$Res> {
  __$TypeSlotCopyWithImpl(this._self, this._then);

  final _TypeSlot _self;
  final $Res Function(_TypeSlot) _then;

/// Create a copy of TypeSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slot = freezed,Object? type = freezed,}) {
  return _then(_TypeSlot(
slot: freezed == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NamedUrl?,
  ));
}

/// Create a copy of TypeSlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NamedUrlCopyWith<$Res>? get type {
    if (_self.type == null) {
    return null;
  }

  return $NamedUrlCopyWith<$Res>(_self.type!, (value) {
    return _then(_self.copyWith(type: value));
  });
}
}


/// @nodoc
mixin _$NameUrl {

 String? get name; String? get url;
/// Create a copy of NameUrl
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NameUrlCopyWith<NameUrl> get copyWith => _$NameUrlCopyWithImpl<NameUrl>(this as NameUrl, _$identity);

  /// Serializes this NameUrl to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NameUrl&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'NameUrl(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $NameUrlCopyWith<$Res>  {
  factory $NameUrlCopyWith(NameUrl value, $Res Function(NameUrl) _then) = _$NameUrlCopyWithImpl;
@useResult
$Res call({
 String? name, String? url
});




}
/// @nodoc
class _$NameUrlCopyWithImpl<$Res>
    implements $NameUrlCopyWith<$Res> {
  _$NameUrlCopyWithImpl(this._self, this._then);

  final NameUrl _self;
  final $Res Function(NameUrl) _then;

/// Create a copy of NameUrl
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NameUrl].
extension NameUrlPatterns on NameUrl {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NameUrl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NameUrl() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NameUrl value)  $default,){
final _that = this;
switch (_that) {
case _NameUrl():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NameUrl value)?  $default,){
final _that = this;
switch (_that) {
case _NameUrl() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NameUrl() when $default != null:
return $default(_that.name,_that.url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? url)  $default,) {final _that = this;
switch (_that) {
case _NameUrl():
return $default(_that.name,_that.url);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _NameUrl() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NameUrl implements NameUrl {
  const _NameUrl({this.name, this.url});
  factory _NameUrl.fromJson(Map<String, dynamic> json) => _$NameUrlFromJson(json);

@override final  String? name;
@override final  String? url;

/// Create a copy of NameUrl
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NameUrlCopyWith<_NameUrl> get copyWith => __$NameUrlCopyWithImpl<_NameUrl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NameUrlToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NameUrl&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'NameUrl(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$NameUrlCopyWith<$Res> implements $NameUrlCopyWith<$Res> {
  factory _$NameUrlCopyWith(_NameUrl value, $Res Function(_NameUrl) _then) = __$NameUrlCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? url
});




}
/// @nodoc
class __$NameUrlCopyWithImpl<$Res>
    implements _$NameUrlCopyWith<$Res> {
  __$NameUrlCopyWithImpl(this._self, this._then);

  final _NameUrl _self;
  final $Res Function(_NameUrl) _then;

/// Create a copy of NameUrl
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? url = freezed,}) {
  return _then(_NameUrl(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
