import 'package:currency_converter_app/models/timeseries.dart';
import 'package:flutter/material.dart';

class RateInformation extends StatelessWidget {
  final Timeseries timeseries;
  final String symbol;
  RateInformation(this.timeseries, this.symbol);

  final today = DateTime.now().toString().substring(0, 10);
  final yesterday =
      DateTime.now().subtract(Duration(days: 1)).toString().substring(0, 10);

  double difference;
  double percentage;

  bool calculateChangePercentage() {
    final rateToday = timeseries.rates[today][symbol];
    final rateYesterday = timeseries.rates[yesterday][symbol];
    difference = rateToday - rateYesterday;
    //print(difference);
    final absoluteDifference = difference.abs();
    //print(absoluteDifference);
    percentage = absoluteDifference / rateYesterday * 100;
    //print(percentage);
    if (rateToday > rateYesterday)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    final status = calculateChangePercentage();
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
