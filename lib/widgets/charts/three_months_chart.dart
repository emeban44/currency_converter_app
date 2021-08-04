import 'package:currency_converter_app/models/timeseries.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_titles.dart';

class ThreeMonthsChart extends StatelessWidget {
  final Timeseries timeseries;
  final String symbol;
  final String interval;
  ThreeMonthsChart(this.timeseries, this.symbol, this.interval);

  final today = DateTime.now();
  final List<double> past3MonthsData = [];
  final List<String> past3MonthsDates = [];
  final List<double> past3MonthsUnsortedData = [];
  final Map<String, double> mjerenja = {};

  void calculateEverything() {
    for (int i = 0; i < 90; i++) {
      final day = today.subtract(Duration(days: i)).toString();
      past3MonthsDates.add(day.substring(0, 10));
      //print(timeseries.rates[pastWeekDates[i]]);
      past3MonthsData.add(timeseries.rates[past3MonthsDates[i]][symbol]);
      past3MonthsUnsortedData
          .add(timeseries.rates[past3MonthsDates[i]][symbol]);
      mjerenja[i.toString()] = past3MonthsUnsortedData.last;
    }

    //print(mjerenja);
    //print(pastWeekDates);
    past3MonthsData.sort();
    //print(pastWeekData);
    //print(pastWeekData);
  }

  double getY(int x) {
    int xx = x;
    final List<double> past3MonthsReversed = past3MonthsData.reversed.toList();
    //print();
    // print(pastWeekDates[0]);
    // print(timeseries.rates[pastWeekDates[0]][symbol]);
    //print(xx);
    int toReturn = int.parse(mjerenja.keys.firstWhere((e) {
      return mjerenja[e] == past3MonthsReversed[xx];
    }));

    return toReturn.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    calculateEverything();
    return Container(
      //color: Colors.grey,
      height: 500,
      margin: EdgeInsets.only(left: 20, right: 35, top: 15),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 89,
          minY: 0,
          maxY: past3MonthsData.length.toDouble() - 1,
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
              LineTitles.get3MonthsTitleData(past3MonthsData, past3MonthsDates),
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
              dotData: FlDotData(show: false),
              barWidth: 2,
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
                FlSpot(31, getY(31).toDouble()),
                FlSpot(32, getY(32).toDouble()),
                FlSpot(33, getY(33).toDouble()),
                FlSpot(34, getY(34).toDouble()),
                FlSpot(35, getY(35).toDouble()),
                FlSpot(36, getY(36).toDouble()),
                FlSpot(37, getY(37).toDouble()),
                FlSpot(38, getY(38).toDouble()),
                FlSpot(39, getY(39).toDouble()),
                FlSpot(40, getY(40).toDouble()),
                FlSpot(41, getY(41).toDouble()),
                FlSpot(42, getY(42).toDouble()),
                FlSpot(43, getY(43).toDouble()),
                FlSpot(44, getY(44).toDouble()),
                FlSpot(45, getY(45).toDouble()),
                FlSpot(46, getY(46).toDouble()),
                FlSpot(47, getY(47).toDouble()),
                FlSpot(48, getY(48).toDouble()),
                FlSpot(49, getY(49).toDouble()),
                FlSpot(50, getY(50).toDouble()),
                FlSpot(51, getY(51).toDouble()),
                FlSpot(52, getY(52).toDouble()),
                FlSpot(53, getY(53).toDouble()),
                FlSpot(54, getY(54).toDouble()),
                FlSpot(55, getY(55).toDouble()),
                FlSpot(56, getY(56).toDouble()),
                FlSpot(57, getY(57).toDouble()),
                FlSpot(58, getY(58).toDouble()),
                FlSpot(59, getY(59).toDouble()),
                FlSpot(60, getY(60).toDouble()),
                FlSpot(61, getY(61).toDouble()),
                FlSpot(62, getY(62).toDouble()),
                FlSpot(63, getY(63).toDouble()),
                FlSpot(64, getY(64).toDouble()),
                FlSpot(65, getY(65).toDouble()),
                FlSpot(66, getY(66).toDouble()),
                FlSpot(67, getY(67).toDouble()),
                FlSpot(68, getY(68).toDouble()),
                FlSpot(69, getY(69).toDouble()),
                FlSpot(70, getY(70).toDouble()),
                FlSpot(71, getY(71).toDouble()),
                FlSpot(72, getY(72).toDouble()),
                FlSpot(73, getY(73).toDouble()),
                FlSpot(74, getY(74).toDouble()),
                FlSpot(75, getY(75).toDouble()),
                FlSpot(76, getY(76).toDouble()),
                FlSpot(77, getY(77).toDouble()),
                FlSpot(78, getY(78).toDouble()),
                FlSpot(79, getY(79).toDouble()),
                FlSpot(80, getY(80).toDouble()),
                FlSpot(81, getY(81).toDouble()),
                FlSpot(82, getY(82).toDouble()),
                FlSpot(83, getY(83).toDouble()),
                FlSpot(84, getY(84).toDouble()),
                FlSpot(85, getY(85).toDouble()),
                FlSpot(86, getY(86).toDouble()),
                FlSpot(87, getY(87).toDouble()),
                FlSpot(88, getY(88).toDouble()),
                FlSpot(89, getY(89).toDouble()),
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
