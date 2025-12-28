// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_list.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PokemonListItem {

 String? get name; String? get url;
/// Create a copy of PokemonListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonListItemCopyWith<PokemonListItem> get copyWith => _$PokemonListItemCopyWithImpl<PokemonListItem>(this as PokemonListItem, _$identity);

  /// Serializes this PokemonListItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonListItem&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonListItem(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $PokemonListItemCopyWith<$Res>  {
  factory $PokemonListItemCopyWith(PokemonListItem value, $Res Function(PokemonListItem) _then) = _$PokemonListItemCopyWithImpl;
@useResult
$Res call({
 String? name, String? url
});




}
/// @nodoc
class _$PokemonListItemCopyWithImpl<$Res>
    implements $PokemonListItemCopyWith<$Res> {
  _$PokemonListItemCopyWithImpl(this._self, this._then);

  final PokemonListItem _self;
  final $Res Function(PokemonListItem) _then;

/// Create a copy of PokemonListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? url = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonListItem].
extension PokemonListItemPatterns on PokemonListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonListItem value)  $default,){
final _that = this;
switch (_that) {
case _PokemonListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonListItem value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonListItem() when $default != null:
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
case _PokemonListItem() when $default != null:
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
case _PokemonListItem():
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
case _PokemonListItem() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PokemonListItem implements PokemonListItem {
  const _PokemonListItem({this.name, this.url});
  factory _PokemonListItem.fromJson(Map<String, dynamic> json) => _$PokemonListItemFromJson(json);

@override final  String? name;
@override final  String? url;

/// Create a copy of PokemonListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonListItemCopyWith<_PokemonListItem> get copyWith => __$PokemonListItemCopyWithImpl<_PokemonListItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PokemonListItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonListItem&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,url);

@override
String toString() {
  return 'PokemonListItem(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$PokemonListItemCopyWith<$Res> implements $PokemonListItemCopyWith<$Res> {
  factory _$PokemonListItemCopyWith(_PokemonListItem value, $Res Function(_PokemonListItem) _then) = __$PokemonListItemCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? url
});




}
/// @nodoc
class __$PokemonListItemCopyWithImpl<$Res>
    implements _$PokemonListItemCopyWith<$Res> {
  __$PokemonListItemCopyWithImpl(this._self, this._then);

  final _PokemonListItem _self;
  final $Res Function(_PokemonListItem) _then;

/// Create a copy of PokemonListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? url = freezed,}) {
  return _then(_PokemonListItem(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
