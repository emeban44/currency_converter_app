import 'package:currency_converter_app/widgets/calculator_box.dart';
import 'package:flutter/material.dart';

class CalculatorRow extends StatelessWidget {
  final String first;
  final String second;
  final String third;
  final String last;
  CalculatorRow(this.first, this.second, this.third, this.last);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CalculatorBox(first, false),
          CalculatorBox(second, false),
          CalculatorBox(third, false),
          CalculatorBox(last, true),
        ],
      ),
    );
  }
}
