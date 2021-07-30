import 'package:currency_converter_app/models/timeseries.dart';
import 'package:flutter/material.dart';

class RateInformation extends StatelessWidget {
  final Timeseries timeseries;
  final String symbol;
  final List<bool> interval;
  RateInformation(this.timeseries, this.symbol, this.interval);

  final today = DateTime.now().toString().substring(0, 10);
  final sevenDaysAgo =
      DateTime.now().subtract(Duration(days: 7)).toString().substring(0, 10);
  final oneMonthAgo =
      DateTime.now().subtract(Duration(days: 30)).toString().substring(0, 10);

  double difference;
  double percentage;

  void calculateChangePercentage() {
    final rateToday = timeseries.rates[today][symbol];
    if (interval[0]) {
      final rateSevenDaysAgo = timeseries.rates[sevenDaysAgo][symbol];
      difference = rateToday - rateSevenDaysAgo;
      final absoluteDifference = difference.abs();
      percentage = absoluteDifference / rateSevenDaysAgo * 100;
    } else if (interval[1] || interval[2] || interval[3]) {
      final rateOneMonthAgo = timeseries.rates[oneMonthAgo][symbol];
      difference = rateToday - rateOneMonthAgo;
      final absoluteDifference = difference.abs();
      percentage = absoluteDifference / rateOneMonthAgo * 100;
    }
    print(difference);
  }

  @override
  Widget build(BuildContext context) {
    calculateChangePercentage();
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 25),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  '1 ' +
                      timeseries.base +
                      ' = ' +
                      timeseries.rates[today][symbol].toString() +
                      ' ' +
                      symbol,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if (difference.isNegative)
                  Icon(Icons.arrow_drop_down, size: 30, color: Colors.red)
                else
                  Icon(Icons.arrow_drop_up_outlined,
                      size: 30, color: Colors.green)
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Text(
                  difference.toStringAsFixed(4) +
                      '(' +
                      percentage.toStringAsFixed(2) +
                      '%' +
                      ')',
                  style: TextStyle(
                      color: difference.isNegative ? Colors.red : Colors.green),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    today,
                    style: TextStyle(color: Colors.black54),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
