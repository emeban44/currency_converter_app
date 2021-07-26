// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

import 'local_currency.dart';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

String currencyToJson(Currency data) => json.encode(data.toJson());

LocalCurrency toLocal(Currency c) {
  final lc = LocalCurrency()
    ..base = c.base
    ..date = c.date
    ..rates = c.rates
    ..success = c.success
    ..timestamp = c.timestamp;
  return lc;
}

Currency fromLocal(LocalCurrency lc) {
  final c = Currency(
      base: lc.base,
      date: lc.date,
      rates: lc.rates,
      success: lc.success,
      timestamp: lc.timestamp);
  return c;
}

class Currency {
  Currency({
    this.success,
    this.timestamp,
    this.base,
    this.date,
    this.rates,
  });

  bool success;
  int timestamp;
  String base;
  DateTime date;
  Map<String, double> rates;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        success: json["success"],
        timestamp: json["timestamp"],
        base: json["base"],
        date: DateTime.parse(json["date"]),
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "timestamp": timestamp,
        "base": base,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
