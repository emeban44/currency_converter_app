// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_currency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalCurrencyAdapter extends TypeAdapter<LocalCurrency> {
  @override
  final int typeId = 0;

  @override
  LocalCurrency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalCurrency()
      ..success = fields[0] as bool
      ..timestamp = fields[1] as int
      ..base = fields[2] as String
      ..date = fields[3] as DateTime
      ..rates = (fields[4] as Map)?.cast<String, double>();
  }

  @override
  void write(BinaryWriter writer, LocalCurrency obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.base)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.rates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalCurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
