import 'package:flutter/material.dart';

class AmountInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        // padding: const EdgeInsets.only(top: 100),
        margin: const EdgeInsets.only(left: 20, right: 20),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Colors.blue.shade50,
              Colors.blue.shade100,
            ])),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
