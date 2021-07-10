import 'package:flutter/material.dart';

class AmountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100, left: 20),
      height: 30,
      child: Text(
        'Amount',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
