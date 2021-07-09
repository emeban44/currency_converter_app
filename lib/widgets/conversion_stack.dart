import 'package:currency_converter_app/widgets/amount_input_field.dart';
import 'package:currency_converter_app/widgets/amount_text.dart';
import 'package:currency_converter_app/widgets/conversion_output_box.dart';
import 'package:currency_converter_app/widgets/conversion_row.dart';
import 'package:currency_converter_app/widgets/stack_background.dart';
import 'package:flutter/material.dart';

class ConversionStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBackground(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AmountText(),
            AmountInputField(),
            ConversionRow(),
            ConversionOutputBox(),
          ],
        ),
      ],
    );
  }
}
