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

  static getYearlyTitleData(pastWeekData, pastWeekDates) => FlTitlesData(
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
              if (value == 31) return null;
              if (value == 33) return null;
              if (value == 35) return null;
              if (value == 37) return null;
              if (value == 39) return null;
              if (value == 41) return null;
              if (value == 43) return null;
              if (value == 45) return null;
              if (value == 47) return null;
              if (value == 49) return null;
              if (value == 51) return null;
              if (value == 53) return null;
              if (value == 55) return null;
              if (value == 57) return null;
              if (value == 59) return null;
              if (value == 61) return null;
              if (value == 63) return null;
              if (value == 65) return null;
              if (value == 67) return null;
              if (value == 69) return null;
              if (value == 71) return null;
              if (value == 73) return null;
              if (value == 75) return null;
              if (value == 77) return null;
              if (value == 79) return null;
              if (value == 81) return null;
              if (value == 83) return null;
              if (value == 85) return null;
              if (value == 87) return null;
              if (value == 89) return null;
              if (value == 91) return null;
              if (value == 93) return null;
              if (value == 95) return null;
              if (value == 97) return null;
              if (value == 99) return null;
              if (value == 101) return null;
              if (value == 103) return null;
              if (value == 105) return null;
              if (value == 107) return null;
              if (value == 109) return null;
              if (value == 111) return null;
              if (value == 113) return null;
              if (value == 115) return null;
              if (value == 117) return null;
              if (value == 119) return null;
              if (value == 121) return null;
              if (value == 123) return null;
              if (value == 125) return null;
              if (value == 127) return null;
              if (value == 129) return null;
              if (value == 131) return null;
              if (value == 133) return null;
              if (value == 135) return null;
              if (value == 137) return null;
              if (value == 139) return null;
              if (value == 141) return null;
              if (value == 143) return null;
              if (value == 145) return null;
              if (value == 147) return null;
              if (value == 149) return null;
              if (value == 151) return null;
              if (value == 153) return null;
              if (value == 155) return null;
              if (value == 157) return null;
              if (value == 159) return null;
              if (value == 161) return null;
              if (value == 163) return null;
              if (value == 165) return null;
              if (value == 167) return null;
              if (value == 169) return null;
              if (value == 171) return null;
              if (value == 173) return null;
              if (value == 175) return null;
              if (value == 177) return null;
              if (value == 179) return null;
              if (value == 181) return null;
              if (value == 183) return null;
              if (value == 185) return null;
              if (value == 187) return null;
              if (value == 189) return null;
              if (value == 191) return null;
              if (value == 193) return null;
              if (value == 195) return null;
              if (value == 197) return null;
              if (value == 199) return null;
              if (value == 201) return null;
              if (value == 203) return null;
              if (value == 205) return null;
              if (value == 207) return null;
              if (value == 209) return null;
              if (value == 211) return null;
              if (value == 213) return null;
              if (value == 215) return null;
              if (value == 217) return null;
              if (value == 219) return null;
              if (value == 221) return null;
              if (value == 223) return null;
              if (value == 225) return null;
              if (value == 227) return null;
              if (value == 229) return null;
              if (value == 231) return null;
              if (value == 233) return null;
              if (value == 235) return null;
              if (value == 237) return null;
              if (value == 239) return null;
              if (value == 241) return null;
              if (value == 243) return null;
              if (value == 245) return null;
              if (value == 247) return null;
              if (value == 249) return null;
              if (value == 251) return null;
              if (value == 253) return null;
              if (value == 255) return null;
              if (value == 257) return null;
              if (value == 259) return null;
              if (value == 261) return null;
              if (value == 263) return null;
              if (value == 265) return null;
              if (value == 267) return null;
              if (value == 269) return null;
              if (value == 271) return null;
              if (value == 273) return null;
              if (value == 275) return null;
              if (value == 277) return null;
              if (value == 279) return null;
              if (value == 281) return null;
              if (value == 283) return null;
              if (value == 285) return null;
              if (value == 287) return null;
              if (value == 289) return null;
              if (value == 291) return null;
              if (value == 293) return null;
              if (value == 295) return null;
              if (value == 297) return null;
              if (value == 299) return null;
              if (value == 301) return null;
              if (value == 303) return null;
              if (value == 305) return null;
              if (value == 307) return null;
              if (value == 309) return null;
              if (value == 311) return null;
              if (value == 313) return null;
              if (value == 315) return null;
              if (value == 317) return null;
              if (value == 319) return null;
              if (value == 321) return null;
              if (value == 323) return null;
              if (value == 325) return null;
              if (value == 327) return null;
              if (value == 329) return null;
              if (value == 331) return null;
              if (value == 333) return null;
              if (value == 335) return null;
              if (value == 337) return null;
              if (value == 339) return null;
              if (value == 341) return null;
              if (value == 343) return null;
              if (value == 345) return null;
              if (value == 347) return null;
              if (value == 349) return null;
              if (value == 351) return null;
              if (value == 353) return null;
              if (value == 355) return null;
              if (value == 357) return null;
              if (value == 359) return null;
              if (value == 361) return null;
              if (value == 363) return null;
              //print(pastWeekData[value.toInt() - 1].toStringAsFixed(3));
              return pastWeekData[value.toInt()].toStringAsFixed(3);

              //return '';
            }),
        topTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            if (value == 350) return pastWeekDates[0];
            if (value == 0) return pastWeekDates[364];
            if (value == 150) return pastWeekDates[175];
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
