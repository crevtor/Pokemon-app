// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonQuery {

 String? get searchTerm; int get pageSize;
/// Create a copy of PokemonQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonQueryCopyWith<PokemonQuery> get copyWith => _$PokemonQueryCopyWithImpl<PokemonQuery>(this as PokemonQuery, _$identity);

  /// Serializes this PokemonQuery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonQuery&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchTerm,pageSize);

@override
String toString() {
  return 'PokemonQuery(searchTerm: $searchTerm, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $PokemonQueryCopyWith<$Res>  {
  factory $PokemonQueryCopyWith(PokemonQuery value, $Res Function(PokemonQuery) _then) = _$PokemonQueryCopyWithImpl;
@useResult
$Res call({
 String? searchTerm, int pageSize
});




}
/// @nodoc
class _$PokemonQueryCopyWithImpl<$Res>
    implements $PokemonQueryCopyWith<$Res> {
  _$PokemonQueryCopyWithImpl(this._self, this._then);

  final PokemonQuery _self;
  final $Res Function(PokemonQuery) _then;

/// Create a copy of PokemonQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchTerm = freezed,Object? pageSize = null,}) {
  return _then(_self.copyWith(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonQuery].
extension PokemonQueryPatterns on PokemonQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonQuery value)  $default,){
final _that = this;
switch (_that) {
case _PokemonQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonQuery value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? searchTerm,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonQuery() when $default != null:
return $default(_that.searchTerm,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? searchTerm,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _PokemonQuery():
return $default(_that.searchTerm,_that.pageSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? searchTerm,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _PokemonQuery() when $default != null:
return $default(_that.searchTerm,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonQuery extends PokemonQuery {
  const _PokemonQuery({this.searchTerm, this.pageSize = 20}): super._();
  factory _PokemonQuery.fromJson(Map<String, dynamic> json) => _$PokemonQueryFromJson(json);

@override final  String? searchTerm;
@override@JsonKey() final  int pageSize;

/// Create a copy of PokemonQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonQueryCopyWith<_PokemonQuery> get copyWith => __$PokemonQueryCopyWithImpl<_PokemonQuery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonQueryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonQuery&&(identical(other.searchTerm, searchTerm) || other.searchTerm == searchTerm)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchTerm,pageSize);

@override
String toString() {
  return 'PokemonQuery(searchTerm: $searchTerm, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$PokemonQueryCopyWith<$Res> implements $PokemonQueryCopyWith<$Res> {
  factory _$PokemonQueryCopyWith(_PokemonQuery value, $Res Function(_PokemonQuery) _then) = __$PokemonQueryCopyWithImpl;
@override @useResult
$Res call({
 String? searchTerm, int pageSize
});




}
/// @nodoc
class __$PokemonQueryCopyWithImpl<$Res>
    implements _$PokemonQueryCopyWith<$Res> {
  __$PokemonQueryCopyWithImpl(this._self, this._then);

  final _PokemonQuery _self;
  final $Res Function(_PokemonQuery) _then;

/// Create a copy of PokemonQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchTerm = freezed,Object? pageSize = null,}) {
  return _then(_PokemonQuery(
searchTerm: freezed == searchTerm ? _self.searchTerm : searchTerm // ignore: cast_nullable_to_non_nullable
as String?,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
