import 'package:flutter/material.dart';

class AmountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: screenHeight > 800
          ? EdgeInsets.only(top: screenHeight * 0.12, left: 20)
          : EdgeInsets.only(top: screenHeight * 0.10, left: 20),
      height: 30,
      child: Text(
        'Amount',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
