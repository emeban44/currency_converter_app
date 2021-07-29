// To parse this JSON data, do
//
//     final timeseries = timeseriesFromJson(jsonString);

import 'dart:convert';

Timeseries timeseriesFromJson(String str) =>
    Timeseries.fromJson(json.decode(str));

String timeseriesToJson(Timeseries data) => json.encode(data.toJson());

class Timeseries {
  Timeseries({
    this.success,
    this.timeseries,
    this.startDate,
    this.endDate,
    this.base,
    this.rates,
  });

  bool success;
  bool timeseries;
  DateTime startDate;
  DateTime endDate;
  String base;
  Map<String, Map<String, double>> rates;

  factory Timeseries.fromJson(Map<String, dynamic> json) => Timeseries(
        success: json["success"],
        timeseries: json["timeseries"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        base: json["base"],
        rates: Map.from(json["rates"]).map((k, v) =>
            MapEntry<String, Map<String, double>>(
                k,
                Map.from(v)
                    .map((k, v) => MapEntry<String, double>(k, v.toDouble())))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "timeseries": timeseries,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(
            k, Map.from(v).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      };
}
