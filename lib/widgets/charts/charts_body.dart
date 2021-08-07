import 'package:currency_converter_app/models/timeseries.dart';
import 'package:currency_converter_app/providers/historical.dart';
import 'package:currency_converter_app/widgets/charts/currency_container.dart';
import 'package:currency_converter_app/widgets/charts/monthly_chart.dart';
import 'package:currency_converter_app/widgets/charts/swap_icon.dart';
import 'package:currency_converter_app/widgets/charts/three_months_chart.dart';
import 'package:currency_converter_app/widgets/charts/yearly_chart.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import 'line_chart_widget.dart';
import 'rate_information.dart';
import 'rate_stats.dart';
import 'timetable_row.dart';

class ChartsBody extends StatefulWidget {
  final String base;
  final String symbol;
  ChartsBody(this.base, this.symbol);
  @override
  _ChartsBodyState createState() => _ChartsBodyState();
}

class _ChartsBodyState extends State<ChartsBody> {
  bool _isLoading = false;
  bool _hasInternet = true;
  bool _shouldToggle = false;
  Timeseries first;
  Timeseries second;

  List<bool> _selection = [true, false, false, false];

  @override
  void didChangeDependencies() async {
    setState(() {
      _isLoading = true;
    });
    _hasInternet = await InternetConnectionChecker().hasConnection;
    if (_hasInternet) {
      await Provider.of<HistoricalRates>(context, listen: false)
          .fetchAndSetTimeseries(widget.base, widget.symbol);
      final provider = Provider.of<HistoricalRates>(context, listen: false);
      first = provider.getFirstTimeseries;
      second = provider.getSecondTimeseries;
      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
        _hasInternet = false;
      });
    }
    super.didChangeDependencies();
  }

  void _switchInterval(int selectedIndex) {
    setState(() {
      _selection[0] = false;
      _selection[1] = false;
      _selection[2] = false;
      _selection[3] = false;
      _selection[selectedIndex] = true;
    });
  }

  void toggleTimeseries() {
    setState(() {
      _shouldToggle = !_shouldToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.width);
    return SafeArea(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 65,
                color: Color(0xff4f5b8d),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_shouldToggle)
                        CurrencyContainer(widget.symbol)
                      else
                        CurrencyContainer(widget.base),
                      SwapIcon(toggleTimeseries),
                      if (_shouldToggle)
                        CurrencyContainer(widget.base)
                      else
                        CurrencyContainer(widget.symbol),
                    ],
                  ),
                ),
              ),
              TimeTableRow(_selection, _switchInterval),
              if (!_isLoading && !_shouldToggle && _hasInternet)
                RateInformation(first, widget.symbol, _selection),
              if (!_isLoading && _shouldToggle && _hasInternet)
                RateInformation(second, widget.base, _selection),
              if (_isLoading)
                Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: CircularProgressIndicator()),
              if (!_isLoading &&
                  !_shouldToggle &&
                  _selection[0] &&
                  _hasInternet)
                LineChartWidget(first, second.base),
              if (!_isLoading && _shouldToggle && _selection[0] && _hasInternet)
                LineChartWidget(second, first.base),
              if (!_isLoading &&
                  !_shouldToggle &&
                  _selection[1] &&
                  _hasInternet)
                MonthlyChart(first, second.base, '1M'),
              if (!_isLoading && _shouldToggle && _selection[1] && _hasInternet)
                MonthlyChart(second, first.base, '1M'),
              if (!_isLoading &&
                  !_shouldToggle &&
                  _selection[2] &&
                  _hasInternet)
                ThreeMonthsChart(first, second.base, '3M'),
              if (!_isLoading && _shouldToggle && _selection[2] && _hasInternet)
                ThreeMonthsChart(second, first.base, '3M'),
              if (!_isLoading &&
                  !_shouldToggle &&
                  _selection[3] &&
                  _hasInternet)
                YearlyChart(first, second.base, '1Y'),
              if (!_isLoading && _shouldToggle && _selection[3] && _hasInternet)
                YearlyChart(second, first.base, '1Y'),
              if (!_isLoading && !_shouldToggle && _hasInternet)
                RateStats(first, widget.symbol, _selection),
              if (!_isLoading && _shouldToggle && _hasInternet)
                RateStats(second, first.base, _selection),
              if (!_hasInternet)
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 200),
                  child: Text('No internet connection'),
                )
            ],
          ),
        ),
      ),
    );
  }
}
