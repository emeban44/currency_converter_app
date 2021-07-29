import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/models/timeseries.dart';
import 'package:currency_converter_app/providers/historical.dart';
import 'package:currency_converter_app/widgets/charts/currency_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'line_chart_widget.dart';

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

  void toggleTimeseries() {
    setState(() {
      _shouldToggle = !_shouldToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
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
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      child: //Icon(
                          // icon:
                          GestureDetector(
                              onTap: () {
                                toggleTimeseries();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(Icons.swap_horiz,
                                    size: 40, color: Colors.white),
                              )),
                      //onPressed: () {},
                    ),
                    //),
                    if (_shouldToggle)
                      CurrencyContainer(widget.base)
                    else
                      CurrencyContainer(widget.symbol),
                  ],
                ),
              ),
            ),
            if (_isLoading) CircularProgressIndicator(),
            if (!_isLoading && !_shouldToggle)
              LineChartWidget(first, second.base),
            if (!_isLoading && _shouldToggle)
              LineChartWidget(second, first.base),
          ],
        ),
      ),
    );
  }
}
