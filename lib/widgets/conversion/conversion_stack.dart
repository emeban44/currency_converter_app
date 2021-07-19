import 'package:currency_converter_app/widgets/amount/amount_input_field.dart';
import 'package:currency_converter_app/widgets/amount/amount_text.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_output_box.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_row.dart';
import 'package:currency_converter_app/widgets/conversion/edit_button.dart';
import 'package:currency_converter_app/widgets/stack_background.dart';
import 'package:flutter/material.dart';

class ConversionStack extends StatelessWidget {
  final Function(bool toggle) _toggleCalc;
  ConversionStack(this._toggleCalc);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: MediaQuery.of(context).size.height * 0.50,
      child: Stack(
        children: [
          StackBackground(),
          // EditButton(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AmountText(),
              AmountInputField(_toggleCalc),
              ConversionRow(),
              ConversionOutputBox(),
            ],
          ),
        ],
      ),
    );
  }
}
