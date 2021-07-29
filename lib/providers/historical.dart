import 'package:currency_converter_app/models/timeseries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoricalRates with ChangeNotifier {
  Timeseries _firstTimeseries;
  Timeseries _secondTimeseries;

  Timeseries get getFirstTimeseries {
    return this._firstTimeseries;
  }

  Timeseries get getSecondTimeseries {
    return this._secondTimeseries;
  }

  void toggleTimeseries() {
    Timeseries tmp1 = _firstTimeseries;
    Timeseries tmp2 = _secondTimeseries;
    this._firstTimeseries = tmp2;
    this._secondTimeseries = tmp1;
    notifyListeners();
  }

  void setTimeseries(Timeseries first, Timeseries second) {
    this._firstTimeseries = first;
    this._secondTimeseries = second;
    notifyListeners();
  }

  Future<void> fetchAndSetTimeseries(
      String widgetBase, String widgetSymbol) async {
    final base = widgetBase;
    final symbol = widgetSymbol;
    final today = DateTime.now().toString().substring(0, 10);
    final yearAgo = DateTime.now()
        .subtract(Duration(days: 365))
        .toString()
        .substring(0, 10);
    final url1 = Uri.parse(
        'https://data.fixer.io/api/timeseries?access_key=4946fc8acfd60b0b2040cbbcd6288b36&base=$base&start_date=$yearAgo&end_date=$today&symbols=$symbol');
    final url2 = Uri.parse(
        'https://data.fixer.io/api/timeseries?access_key=4946fc8acfd60b0b2040cbbcd6288b36&base=$symbol&start_date=$yearAgo&end_date=$today&symbols=$base');
    try {
      final responses = await Future.wait([http.get(url1), http.get(url2)]);

      this._firstTimeseries = timeseriesFromJson(responses[0].body);
      this._secondTimeseries = timeseriesFromJson(responses[1].body);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
