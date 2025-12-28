// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secondary_state.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SecondaryStateAdapter extends TypeAdapter<SecondaryState> {
  @override
  final int typeId = 1;

  @override
  SecondaryState read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SecondaryState(isLoggedIn: fields[0] as bool);
  }

  @override
  void write(BinaryWriter writer, SecondaryState obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isLoggedIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SecondaryStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SecondaryState _$SecondaryStateFromJson(Map<String, dynamic> json) =>
    _SecondaryState(isLoggedIn: json['isLoggedIn'] as bool? ?? false);

Map<String, dynamic> _$SecondaryStateToJson(_SecondaryState instance) =>
    <String, dynamic>{'isLoggedIn': instance.isLoggedIn};
