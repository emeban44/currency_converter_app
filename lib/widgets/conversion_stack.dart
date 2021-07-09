import 'package:currency_converter_app/widgets/amount_input_field.dart';
import 'package:currency_converter_app/widgets/amount_text.dart';
import 'package:currency_converter_app/widgets/stack_background.dart';
import 'package:flutter/material.dart';

class ConversionStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StackBackground(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AmountText(),
            AmountInputField(),
          ],
        ),
      ],
    );
  }
}
