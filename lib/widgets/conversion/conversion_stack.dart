import 'package:currency_converter_app/widgets/amount/amount_input_field.dart';
import 'package:currency_converter_app/widgets/amount/amount_text.dart';
import 'package:currency_converter_app/widgets/calculator/custom_calculator.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_output_box.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_row.dart';
import 'package:currency_converter_app/widgets/stack_background.dart';
import 'package:flutter/material.dart';

class ConversionStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: MediaQuery.of(context).size.height * 0.50,
      child: Stack(
        children: [
          StackBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AmountText(),
              AmountInputField(),
              ConversionRow(),
              ConversionOutputBox(),
              //  CustomCalculator(),
            ],
          ),
        ],
      ),
    );
  }
}
