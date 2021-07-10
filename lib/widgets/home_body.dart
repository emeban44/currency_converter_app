import 'package:currency_converter_app/widgets/calculator/custom_calculator.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_stack.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ConversionStack(),
          fit: FlexFit.loose,
        ),
        Flexible(
          child: CustomCalculator(),
          fit: FlexFit.loose,
        )
      ],
    );
  }
}
