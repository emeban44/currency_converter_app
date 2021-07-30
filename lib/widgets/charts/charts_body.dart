import 'package:currency_converter_app/models/timeseries.dart';
import 'package:currency_converter_app/providers/historical.dart';
import 'package:currency_converter_app/widgets/charts/currency_container.dart';
import 'package:currency_converter_app/widgets/charts/monthly_chart.dart';
import 'package:currency_converter_app/widgets/charts/swap_icon.dart';
import 'package:flutter/material.dart';
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
  bool _shouldToggle = false;
  Timeseries first;
  Timeseries second;

  List<bool> _selection = [true, false, false, false];

  @override
  void didChangeDependencies() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<HistoricalRates>(context, listen: false)
        .fetchAndSetTimeseries(widget.base, widget.symbol);
    final provider = Provider.of<HistoricalRates>(context, listen: false);
    first = provider.getFirstTimeseries;
    second = provider.getSecondTimeseries;
    setState(() {
      _isLoading = false;
    });
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
    print(MediaQuery.of(context).size.width);
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
              if (!_isLoading && !_shouldToggle)
                RateInformation(first, widget.symbol, _selection),
              if (!_isLoading && _shouldToggle)
                RateInformation(second, widget.base, _selection),
              if (_isLoading)
                Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: CircularProgressIndicator()),
              if (!_isLoading && !_shouldToggle && _selection[0])
                LineChartWidget(first, second.base),
              if (!_isLoading && _shouldToggle && _selection[0])
                LineChartWidget(second, first.base),
              if (!_isLoading && !_shouldToggle && _selection[1])
                MonthlyChart(first, second.base, '1M'),
              if (!_isLoading && _shouldToggle && _selection[1])
                MonthlyChart(second, first.base, '1M'),
              if (!_isLoading && !_shouldToggle)
                RateStats(first, widget.symbol, _selection),
              if (!_isLoading && _shouldToggle)
                RateStats(second, first.base, _selection),
            ],
          ),
        ),
      ),
    );
  }
}
