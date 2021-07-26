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

  // LocalCurrency({
  //   this.id,
  //   this.success,
  //   this.timestamp,
  //   this.base,
  //   this.date,
  //   this.rates,
  // });
}

// final String tableCurrencies = 'localCurrencies';

// class CurrencyFields {
//   static final String id = '_id';
//   static final String success = 'success';
//   static final String timestamp = 'timestamp';
//   static final String base = 'base';
//   static final String date = 'date';
//   static final String rates = 'rates';
// }
