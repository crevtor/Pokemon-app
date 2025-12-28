import 'package:hive/hive.dart';
import 'package:pokemon/core/services/export.services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'secondary_state.model.freezed.dart';
part 'secondary_state.model.g.dart';

@freezed
@HiveType(typeId: HiveTypeConstant.secondaryState, adapterName: 'SecondaryStateAdapter')
abstract class SecondaryState with _$SecondaryState {
  const SecondaryState._();

  const factory SecondaryState({
    @HiveField(0) @Default(false) bool isLoggedIn,
  }) = _SecondaryState;

  factory SecondaryState.fromJson(Map<String, dynamic> json) =>
      _$SecondaryStateFromJson(json);

  factory SecondaryState.empty() => const SecondaryState();

  SecondaryState updateLoginState(bool value) => copyWith(isLoggedIn: value);
}
