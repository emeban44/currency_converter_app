import 'package:currency_converter_app/models/timeseries.dart';
import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  final String text;
  final Timeseries timeseries;
  final String symbol;
  StatsBar(this.text, this.timeseries, this.symbol);

  final today = DateTime.now();
  final List<String> pastWeekDates = [];
  final List<double> pastWeekData = [];

  void highLowAverageCalculation() {
    for (int i = 0; i < 7; i++) {
      final day = today.subtract(Duration(days: i)).toString();
      pastWeekDates.add(day.substring(0, 10));
      //print(timeseries.rates[pastWeekDates[i]]);
      pastWeekData.add(timeseries.rates[pastWeekDates[i]][symbol]);
      //pastWeekUnsortedData.add(timeseries.rates[pastWeekDates[i]][symbol]);
      // mjerenja[i.toString()] = pastWeekUnsortedData.last;
    }
    //print(pastWeekDates);
    pastWeekData.sort();
    //print(pastWeekData);
  }

  double averageRate() {
    double sum = 0;
    pastWeekData.forEach((e) {
      sum += e;
    });
    return sum / pastWeekData.length;
  }

  @override
  Widget build(BuildContext context) {
    highLowAverageCalculation();
    return Container(
      height: 45,
      margin: const EdgeInsets.only(left: 12.5, right: 12.5, top: 10),
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
            style: TextStyle(color: Colors.black54),
          ),
          if (text == 'High') Text(pastWeekData.last.toStringAsFixed(6)),
          if (text == 'Low') Text(pastWeekData.first.toStringAsFixed(6)),
          if (text == 'Average') Text(averageRate().toStringAsFixed(6)),
        ],
      ),
    );
  }
}
