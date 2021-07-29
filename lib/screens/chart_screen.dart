import 'package:currency_converter_app/models/symbols.dart';
import 'package:currency_converter_app/models/timeseries.dart';
import 'package:currency_converter_app/widgets/charts/charts_body.dart';
import 'package:currency_converter_app/widgets/charts/line_chart_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChartScreen extends StatelessWidget {
  static const routeName = '/chart';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Historical rate'),
        elevation: 1,
        backgroundColor: Color(0xff4f5b8d),
      ),
      body: ChartsBody(arguments[0], arguments[1]),
    );
  }
}

/*
onPressed: () async {
            setState(() {
              _isLoading = true;
            });
            final apiKey = '4946fc8acfd60b0b2040cbbcd6288b36';
            final List<String> bases = Symbols.abbreviations;
            final List urls = [];
            final List<Timeseries> listToReturn = [];
            for (int i = 0; i < bases.length; i++) {
              final base = bases[i];
              urls.add(Uri.parse(
                  'https://data.fixer.io/api/timeseries?access_key=$apiKey&base=$base&start_date=2020-07-27&end_date=2021-07-27'));
            }
            try {
              print('try');
              List responses = await Future.wait(
                  [for (int i = 0; i < 70; i++) http.get(urls[i])]);

              List responses2ndHalf = await Future.wait(
                [
                  for (int i = 70; i < bases.length; i++) http.get(urls[i]),
                ],
              );

              for (int i = 0; i < responses.length; i++) {
                listToReturn.add(timeseriesFromJson(responses[i].body));
              }
              for (int i = 0; i < responses2ndHalf.length - 1; i++) {
                listToReturn.add(timeseriesFromJson(responses2ndHalf[i].body));
              }
            } catch (error) {
              print(error);
            }
            setState(() {
              _isLoading = false;
            });
            print(listToReturn.length);
            //'https://data.fixer.io/api/timeseries?access_key=$apiKey&base=BAM&start_date=2020-07-27&end_date=2021-07-27';
          }, */
