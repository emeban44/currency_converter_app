import 'package:currency_converter_app/widgets/calculator_row.dart';
import 'package:currency_converter_app/widgets/done_button.dart';
import 'package:flutter/material.dart';

class CustomCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.52,
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
          DoneButton(),
        ],
      ),
    );
  }
}
