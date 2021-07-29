import 'package:currency_converter_app/models/timeseries.dart';
import 'package:currency_converter_app/widgets/charts/stats_bar.dart';
import 'package:flutter/material.dart';

class RateStats extends StatelessWidget {
  final Timeseries timeseries;
  final String symbol;
  RateStats(this.timeseries, this.symbol);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Stats',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          StatsBar('High', timeseries, symbol),
          StatsBar('Low', timeseries, symbol),
          StatsBar('Average', timeseries, symbol),
        ],
      ),
    );
  }
}
