import 'package:currency_converter_app/widgets/charts/charts_body.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatelessWidget {
  static const routeName = '/chart';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Historical Rates'),
        elevation: 1,
        backgroundColor: Color(0xff4f5b8d),
      ),
      body: ChartsBody(arguments[0], arguments[1]),
    );
  }
}
