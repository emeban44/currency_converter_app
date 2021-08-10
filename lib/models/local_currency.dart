import 'package:hive/hive.dart';

part 'local_currency.g.dart';

@HiveType(typeId: 0)
class LocalCurrency extends HiveObject {
  @HiveField(0)
  bool success;

  @HiveField(1)
  int timestamp;

  @HiveField(2)
  String base;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  Map<String, double> rates;
}
