import 'package:currency_converter_app/models/timeseries.dart';
import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  final String text;
  final Timeseries timeseries;
  final String symbol;
  final List<bool> interval;
  StatsBar(this.text, this.timeseries, this.symbol, this.interval);

  final today = DateTime.now();
  final List<String> pastWeekDates = [];
  final List<double> pastWeekData = [];
  final List<String> pastMonthDates = [];
  final List<double> pastMonthData = [];

  void highLowAverageCalculation() {
    for (int i = 0; i < 7; i++) {
      final day = today.subtract(Duration(days: i)).toString();
      pastWeekDates.add(day.substring(0, 10));
      pastWeekData.add(timeseries.rates[pastWeekDates[i]][symbol]);
    }
    for (int i = 0; i < 31; i++) {
      final day = today.subtract(Duration(days: i)).toString();
      pastMonthDates.add(day.substring(0, 10));
      pastMonthData.add(timeseries.rates[pastMonthDates[i]][symbol]);
    }
    pastWeekData.sort();
    pastMonthData.sort();
  }

  double averageRate() {
    double sum = 0;
    if (interval[0]) {
      pastWeekData.forEach((e) {
        sum += e;
      });
      return sum / pastWeekData.length;
    } else if (interval[1]) {
      pastMonthData.forEach((e) {
        sum += e;
      });
      return sum / pastMonthData.length;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    highLowAverageCalculation();
    return Container(
      height: 45,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black26),
        ),
      ),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          if (text == 'High' && interval[0])
            Text(
              pastWeekData.last.toStringAsFixed(4),
              style: TextStyle(color: Colors.blue.shade900, fontSize: 16),
            ),
          if (text == 'Low' && interval[0])
            Text(
              pastWeekData.first.toStringAsFixed(4),
              style: TextStyle(color: Colors.red.shade900, fontSize: 16),
            ),
          if (text == 'Average' && interval[0])
            Text(
              averageRate().toStringAsFixed(4),
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          if (text == 'High' && interval[1])
            Text(
              pastMonthData.last.toStringAsFixed(4),
              style: TextStyle(color: Colors.blue.shade900, fontSize: 16),
            ),
          if (text == 'Low' && interval[1])
            Text(
              pastMonthData.first.toStringAsFixed(4),
              style: TextStyle(color: Colors.red.shade900, fontSize: 16),
            ),
          if (text == 'Average' && interval[1])
            Text(
              averageRate().toStringAsFixed(4),
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
        ],
      ),
    );
  }
}
