import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  List<double> pastWeekData;
  LineTitles(this.pastWeekData);
  static getTitleData(pastWeekData) => FlTitlesData(
        show: true,
        leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) {
              return TextStyle(fontSize: 8, color: Colors.black);
            },
            getTitles: (value) {
              if (value == 0) return '0';
              //print(pastWeekData[value.toInt() - 1].toStringAsFixed(3));
              return pastWeekData[value.toInt() - 1].toStringAsFixed(3);

              //return '';
            }),
        bottomTitles: SideTitles(
          showTitles: false,
          getTitles: (value) {
            if (value == 2) return 'TUE';
            if (value == 1) return 'MON';
            return '';
          },
          margin: 10,
        ),
      );

  static getStyles() => TextStyle(
        fontSize: 5,
      );
}
