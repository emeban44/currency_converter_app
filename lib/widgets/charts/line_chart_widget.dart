import 'package:currency_converter_app/models/timeseries.dart';
import 'package:currency_converter_app/widgets/charts/line_titles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LineChartWidget extends StatelessWidget {
  final Timeseries timeseries;
  // final String base;
  final String symbol;
  LineChartWidget(this.timeseries, this.symbol);
  final today = DateTime.now();
  final List<String> pastWeekDates = [];
  final List<String> pastMonthDates = [];
  final List<double> pastWeekData = [];
  final List<double> pastWeekUnsortedData = [];
  final List<double> pastMonthData = [];
  final Map<String, double> mjerenja = {};

  void calculateEverything() {
    print('usli');
    // print(timeseries.rates.keys.last);
    for (int i = 0; i < 7; i++) {
      final day = today.subtract(Duration(days: i)).toString();
      pastWeekDates.add(day.substring(0, 10));
      //print(timeseries.rates[pastWeekDates[i]]);
      pastWeekData.add(timeseries.rates[pastWeekDates[i]][symbol]);
      pastWeekUnsortedData.add(timeseries.rates[pastWeekDates[i]][symbol]);
      mjerenja[i.toString()] = pastWeekUnsortedData.last;
    }

    //print(mjerenja);
    //print(pastWeekDates);
    pastWeekData.sort();
    //print(pastWeekData);
    //print(pastWeekData);
  }

  int getY(int x) {
    int xx = x;
    final List<double> pastWeekReversed = pastWeekData.reversed.toList();
    //print(pastWeekReversed);
    // print(pastWeekDates[0]);
    // print(timeseries.rates[pastWeekDates[0]][symbol]);
    //print(xx);
    int toReturn = int.parse(mjerenja.keys.firstWhere((e) {
      return mjerenja[e] == pastWeekReversed[xx];
    }));

    return toReturn;
  }

  @override
  Widget build(BuildContext context) {
    //print(timeseries);
    calculateEverything();
    return Container(
      //color: Colors.grey,
      height: 300,
      margin: EdgeInsets.only(left: 20, right: 35, top: 15),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: pastWeekDates.length.toDouble() - 1,
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
          titlesData: LineTitles.getTitleData(pastWeekData, pastWeekDates),
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
