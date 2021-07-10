import 'package:currency_converter_app/widgets/calculator/custom_calculator.dart';
import 'package:flutter/material.dart';

class AmountInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FocusNode _node;
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
        gradient: LinearGradient(
          colors: [Colors.blue.shade50, Colors.blue.shade100],
        ),
      ),
      child: TextFormField(
        readOnly: true,
        showCursor: true,
        focusNode: _node,
        onTap: () {
          showModalBottomSheet(
              elevation: 0,
              barrierColor: Colors.transparent,
              context: context,
              isDismissible: false,
              builder: (ctx) {
                return CustomCalculator();
              });
        },
        initialValue: '0.00',
        style: TextStyle(fontSize: 23),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
