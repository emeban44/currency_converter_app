import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  List<double> pastWeekData;
  List<String> pastWeekDates;
  LineTitles(this.pastWeekData, this.pastWeekDates);
  static getTitleData(pastWeekData, pastWeekDates) => FlTitlesData(
        show: true,
        leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) {
              return TextStyle(fontSize: 8, color: Colors.black);
            },
            getTitles: (value) {
              //if (value == 0) return '0';
              //print(pastWeekData[value.toInt() - 1].toStringAsFixed(3));
              return pastWeekData[value.toInt()].toStringAsFixed(3);

              //return '';
            }),
        topTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            if (value == 6) return pastWeekDates[0];
            if (value == 0) return pastWeekDates[6];
            if (value == 3) return pastWeekDates[3];
            return '';
          },
          margin: 20,
        ),
        bottomTitles: SideTitles(showTitles: false),
      );

  static getMonthlyTitleData(pastWeekData, pastWeekDates) => FlTitlesData(
        show: true,
        leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) {
              return TextStyle(fontSize: 8, color: Colors.black);
            },
            getTitles: (value) {
              //if (value == 0) return '0';
              //print(pastWeekData[value.toInt() - 1].toStringAsFixed(3));
              return pastWeekData[value.toInt()].toStringAsFixed(3);

              //return '';
            }),
        topTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            if (value == 30) return pastWeekDates[0];
            if (value == 0) return pastWeekDates[30];
            if (value == 15) return pastWeekDates[15];
            return '';
          },
          margin: 20,
        ),
        bottomTitles: SideTitles(showTitles: false),
      );

  static getStyles() => TextStyle(
        fontSize: 5,
      );
}
