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
                      border: Border.all(color: Colors.black, width: 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 1.0,
                            offset: Offset(0.5, 0.5)),
                      ],
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade50, Colors.blue.shade100],
                      )))),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              child: Text('1 EUR = 1.95 BAM',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
