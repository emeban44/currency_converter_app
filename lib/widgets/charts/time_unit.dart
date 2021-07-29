import 'package:flutter/material.dart';

class TimeUnit extends StatelessWidget {
  final String time;
  final bool _isSelected;
  TimeUnit(this.time, this._isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: _isSelected ? Color(0xff4f5b8d) : null,
      ),
      child: Center(
          child: Text(
        time,
        style: TextStyle(
          color: _isSelected ? Colors.white : Colors.black,
        ),
      )),
    );
  }
}
