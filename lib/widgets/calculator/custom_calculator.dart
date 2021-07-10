import 'package:currency_converter_app/widgets/calculator/calculator_row.dart';
import 'package:currency_converter_app/widgets/calculator/done_button.dart';
import 'package:flutter/material.dart';

class CustomCalculator extends StatelessWidget {
  final Function(bool toggle) _toggleCalc;
  final TextEditingController _controller;
  CustomCalculator(this._toggleCalc, this._controller);
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
          CalculatorRow('7', '8', '9', '/', _controller),
          CalculatorRow('4', '5', '6', 'x', _controller),
          CalculatorRow('1', '2', '3', '-', _controller),
          CalculatorRow('.', '0', 'C', '+', _controller),
          DoneButton(_toggleCalc, _controller),
        ],
      ),
    );
  }
}
