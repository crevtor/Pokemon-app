// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secondary_state.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SecondaryState {

@HiveField(0) bool get isLoggedIn;
/// Create a copy of SecondaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecondaryStateCopyWith<SecondaryState> get copyWith => _$SecondaryStateCopyWithImpl<SecondaryState>(this as SecondaryState, _$identity);

  /// Serializes this SecondaryState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecondaryState&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoggedIn);

@override
String toString() {
  return 'SecondaryState(isLoggedIn: $isLoggedIn)';
}


}

/// @nodoc
abstract mixin class $SecondaryStateCopyWith<$Res>  {
  factory $SecondaryStateCopyWith(SecondaryState value, $Res Function(SecondaryState) _then) = _$SecondaryStateCopyWithImpl;
@useResult
$Res call({
@HiveField(0) bool isLoggedIn
});




}
/// @nodoc
class _$SecondaryStateCopyWithImpl<$Res>
    implements $SecondaryStateCopyWith<$Res> {
  _$SecondaryStateCopyWithImpl(this._self, this._then);

  final SecondaryState _self;
  final $Res Function(SecondaryState) _then;

/// Create a copy of SecondaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoggedIn = null,}) {
  return _then(_self.copyWith(
isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SecondaryState].
extension SecondaryStatePatterns on SecondaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecondaryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecondaryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecondaryState value)  $default,){
final _that = this;
switch (_that) {
case _SecondaryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecondaryState value)?  $default,){
final _that = this;
switch (_that) {
case _SecondaryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  bool isLoggedIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecondaryState() when $default != null:
return $default(_that.isLoggedIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  bool isLoggedIn)  $default,) {final _that = this;
switch (_that) {
case _SecondaryState():
return $default(_that.isLoggedIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  bool isLoggedIn)?  $default,) {final _that = this;
switch (_that) {
case _SecondaryState() when $default != null:
return $default(_that.isLoggedIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SecondaryState extends SecondaryState {
  const _SecondaryState({@HiveField(0) this.isLoggedIn = false}): super._();
  factory _SecondaryState.fromJson(Map<String, dynamic> json) => _$SecondaryStateFromJson(json);

@override@JsonKey()@HiveField(0) final  bool isLoggedIn;

/// Create a copy of SecondaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecondaryStateCopyWith<_SecondaryState> get copyWith => __$SecondaryStateCopyWithImpl<_SecondaryState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SecondaryStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecondaryState&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isLoggedIn);

@override
String toString() {
  return 'SecondaryState(isLoggedIn: $isLoggedIn)';
}


}

/// @nodoc
abstract mixin class _$SecondaryStateCopyWith<$Res> implements $SecondaryStateCopyWith<$Res> {
  factory _$SecondaryStateCopyWith(_SecondaryState value, $Res Function(_SecondaryState) _then) = __$SecondaryStateCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) bool isLoggedIn
});




}
/// @nodoc
class __$SecondaryStateCopyWithImpl<$Res>
    implements _$SecondaryStateCopyWith<$Res> {
  __$SecondaryStateCopyWithImpl(this._self, this._then);

  final _SecondaryState _self;
  final $Res Function(_SecondaryState) _then;

/// Create a copy of SecondaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoggedIn = null,}) {
  return _then(_SecondaryState(
isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
