import 'package:currency_converter_app/widgets/conversion_output_box.dart';
import 'package:flutter/material.dart';

class ConversionColumn extends StatelessWidget {
  final String title;
  ConversionColumn(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
                child: Text(title, style: TextStyle(color: Colors.white))),
          ),
          Flexible(
              child: Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade50, Colors.blue.shade100],
                      )))),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(top: 1),
              child: Text('1 EUR = 1.95 BAM',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
