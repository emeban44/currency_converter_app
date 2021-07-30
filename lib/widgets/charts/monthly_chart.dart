import 'package:currency_converter_app/models/timeseries.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_titles.dart';

class MonthlyChart extends StatelessWidget {
  final Timeseries timeseries;
  final String symbol;
  final String interval;
  MonthlyChart(this.timeseries, this.symbol, this.interval);
  final today = DateTime.now();
  final List<double> pastMonthData = [];
  final List<String> pastMonthDates = [];
  //final List<double> pastWeekData = [];
  final List<double> pastMonthUnsortedData = [];
  final Map<String, double> mjerenja = {};

  void calculateEverything() {
    for (int i = 0; i < 31; i++) {
      final day = today.subtract(Duration(days: i)).toString();
      pastMonthDates.add(day.substring(0, 10));
      //print(timeseries.rates[pastWeekDates[i]]);
      pastMonthData.add(timeseries.rates[pastMonthDates[i]][symbol]);
      pastMonthUnsortedData.add(timeseries.rates[pastMonthDates[i]][symbol]);
      mjerenja[i.toString()] = pastMonthUnsortedData.last;
    }

    print(mjerenja);
    //print(pastWeekDates);
    pastMonthData.sort();
    //print(pastWeekData);
    //print(pastWeekData);
  }

  double getY(int x) {
    int xx = x;
    final List<double> pastMonthReversed = pastMonthData.reversed.toList();
    //print();
    // print(pastWeekDates[0]);
    // print(timeseries.rates[pastWeekDates[0]][symbol]);
    //print(xx);
    int toReturn = int.parse(mjerenja.keys.firstWhere((e) {
      return mjerenja[e] == pastMonthReversed[xx];
    }));

    return toReturn.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    calculateEverything();
    return Container(
      //color: Colors.grey,
      height: 300,
      margin: EdgeInsets.only(left: 20, right: 35, top: 15),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 30,
          minY: 0,
          maxY: pastMonthData.length.toDouble() - 1,
          gridData: FlGridData(
            show: true,
            horizontalInterval: 1,
            //drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.indigo,
                strokeWidth: 1,
              );
            },
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.black26,
                strokeWidth: 1,
              );
            },
          ),
          titlesData:
              LineTitles.getMonthlyTitleData(pastMonthData, pastMonthDates),
          borderData: FlBorderData(
            show: true,
            border: Border(
              top: BorderSide(color: Colors.black26),
              bottom: BorderSide(color: Colors.black26),
              right: BorderSide(color: Colors.black12),
              left: BorderSide(color: Colors.black12),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              dotData: FlDotData(
                show: false,
              ),
              barWidth: 5,
              colors: [
                Colors.blue.shade300,
                Colors.blue.shade400,
                Colors.blue.shade600,
                Colors.blue.shade700,
                Colors.blue.shade800,
              ],
              spots: [
                FlSpot(0, getY(0).toDouble()),
                FlSpot(1, getY(1).toDouble()),
                FlSpot(2, getY(2).toDouble()),
                FlSpot(3, getY(3).toDouble()),
                FlSpot(4, getY(4).toDouble()),
                FlSpot(5, getY(5).toDouble()),
                FlSpot(6, getY(6).toDouble()),
                FlSpot(7, getY(7).toDouble()),
                FlSpot(8, getY(8).toDouble()),
                FlSpot(9, getY(9).toDouble()),
                FlSpot(10, getY(10).toDouble()),
                FlSpot(11, getY(11).toDouble()),
                FlSpot(12, getY(12).toDouble()),
                FlSpot(13, getY(13).toDouble()),
                FlSpot(14, getY(14).toDouble()),
                FlSpot(15, getY(15).toDouble()),
                FlSpot(16, getY(16).toDouble()),
                FlSpot(17, getY(17).toDouble()),
                FlSpot(18, getY(18).toDouble()),
                FlSpot(19, getY(19).toDouble()),
                FlSpot(20, getY(20).toDouble()),
                FlSpot(21, getY(21).toDouble()),
                FlSpot(22, getY(22).toDouble()),
                FlSpot(23, getY(23).toDouble()),
                FlSpot(24, getY(24).toDouble()),
                FlSpot(25, getY(25).toDouble()),
                FlSpot(26, getY(26).toDouble()),
                FlSpot(27, getY(27).toDouble()),
                FlSpot(28, getY(28).toDouble()),
                FlSpot(29, getY(29).toDouble()),
                FlSpot(30, getY(30).toDouble()),
                //FlSpot(5, y),
              ],
            )
          ],
          //backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
