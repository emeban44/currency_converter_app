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
              if (value == 1) return null;
              if (value == 3) return null;
              if (value == 5) return null;
              if (value == 7) return null;
              if (value == 9) return null;
              if (value == 11) return null;
              if (value == 13) return null;
              if (value == 15) return null;
              if (value == 17) return null;
              if (value == 19) return null;
              if (value == 21) return null;
              if (value == 23) return null;
              if (value == 25) return null;
              if (value == 27) return null;
              if (value == 29) return null;
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

  static get3MonthsTitleData(pastWeekData, pastWeekDates) => FlTitlesData(
        show: true,
        leftTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) {
              return TextStyle(fontSize: 8, color: Colors.black);
            },
            getTitles: (value) {
              //if (value == 0) return '0';
              if (value == 1) return null;
              if (value == 3) return null;
              if (value == 5) return null;
              if (value == 7) return null;
              if (value == 9) return null;
              if (value == 11) return null;
              if (value == 13) return null;
              if (value == 15) return null;
              if (value == 17) return null;
              if (value == 19) return null;
              if (value == 21) return null;
              if (value == 23) return null;
              if (value == 25) return null;
              if (value == 27) return null;
              if (value == 29) return null;
              //print(pastWeekData[value.toInt() - 1].toStringAsFixed(3));
              return pastWeekData[value.toInt()].toStringAsFixed(3);

              //return '';
            }),
        topTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            if (value == 80) return pastWeekDates[0];
            if (value == 0) return pastWeekDates[89];
            if (value == 40) return pastWeekDates[40];
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
