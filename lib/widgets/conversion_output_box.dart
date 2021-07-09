import 'package:flutter/material.dart';

class ConversionOutputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          height: 90,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
