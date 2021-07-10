import 'package:currency_converter_app/widgets/calculator/custom_calculator.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_stack.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _displayCalculator = false;
  void _toggleCalculator(bool current) {
    setState(() {
      _displayCalculator = current;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: ConversionStack(_toggleCalculator), fit: FlexFit.loose),
        if (_displayCalculator)
          Flexible(
              child: CustomCalculator(_toggleCalculator), fit: FlexFit.loose)
      ],
    );
  }
}
