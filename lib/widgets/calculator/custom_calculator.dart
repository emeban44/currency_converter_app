import 'package:currency_converter_app/widgets/calculator/calculator_row.dart';
import 'package:currency_converter_app/widgets/calculator/done_button.dart';
import 'package:flutter/material.dart';

class CustomCalculator extends StatelessWidget {
  final Function(bool toggle) _toggleCalc;
  CustomCalculator(this._toggleCalc);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Colors.indigo.shade400,
          Colors.blueGrey.shade700,
        ],
      )),
      child: Column(
        children: [
          CalculatorRow('7', '8', '9', '/'),
          CalculatorRow('4', '5', '6', 'x'),
          CalculatorRow('1', '2', '3', '-'),
          CalculatorRow('.', '0', 'C', '+'),
          DoneButton(_toggleCalc),
        ],
      ),
    );
  }
}
