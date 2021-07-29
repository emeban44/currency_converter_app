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
    print(timeseries.rates.keys.last);
    for (int i = 1; i < 8; i++) {
      final day = today.subtract(Duration(days: i)).toString();
      pastWeekDates.add(day.substring(0, 10));
      print(timeseries.rates[pastWeekDates[i - 1]]);
      pastWeekData.add(timeseries.rates[pastWeekDates[i - 1]][symbol]);
      pastWeekUnsortedData.add(timeseries.rates[pastWeekDates[i - 1]][symbol]);
      mjerenja[i.toString()] = pastWeekUnsortedData.last;
    }

    print(mjerenja);
    pastWeekData.sort();
    //print(pastWeekData);
    //print(pastWeekData);
  }

  int getY(double x) {
    int xx = x.toInt();
    final List<double> pastWeekReversed = pastWeekData.reversed.toList();
    //print(xx);
    int toReturn = int.parse(mjerenja.keys.firstWhere((e) {
      if (mjerenja[e] == pastWeekReversed[xx]) {
        print(mjerenja[e]);
        print(pastWeekReversed[xx]);
      }
      return mjerenja[e] == pastWeekReversed[xx];
    }));
    //print(pastWeekData[xx]);
    print(toReturn);
    return toReturn;
  }

  @override
  Widget build(BuildContext context) {
    print(timeseries);
    calculateEverything();
    return Container(
      //color: Colors.grey,
      height: 500,
      margin: EdgeInsets.only(left: 20, right: 30, top: 50),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: pastWeekDates.length.toDouble(),
          gridData: FlGridData(
            show: true,
            //drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.indigo,
                strokeWidth: 1,
              );
            },
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.indigo,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: LineTitles.getTitleData(pastWeekData),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.green, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              barWidth: 5,
              colors: [
                Colors.blue.shade300,
                Colors.blue.shade600,
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
