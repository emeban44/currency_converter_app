import 'package:currency_converter_app/widgets/calculator/calculator_box.dart';
import 'package:flutter/material.dart';

class CalculatorRow extends StatelessWidget {
  final String first;
  final String second;
  final String third;
  final String last;
  final TextEditingController controller;
  CalculatorRow(
      this.first, this.second, this.third, this.last, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CalculatorBox(first, false, controller),
          CalculatorBox(second, false, controller),
          CalculatorBox(third, false, controller),
          CalculatorBox(last, true, controller),
        ],
      ),
    );
  }
}
