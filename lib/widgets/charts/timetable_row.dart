import 'package:currency_converter_app/widgets/charts/time_unit.dart';
import 'package:flutter/material.dart';

class TimeTableRow extends StatefulWidget {
  @override
  _TimeTableRowState createState() => _TimeTableRowState();
}

class _TimeTableRowState extends State<TimeTableRow> {
  List<bool> _selection = [true, false, false, false];

  void _changeSelection(int selectedIndex) {
    if (_selection[selectedIndex] == true) return;
    setState(() {
      _selection[0] = false;
      _selection[1] = false;
      _selection[2] = false;
      _selection[3] = false;
      _selection[selectedIndex] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 7.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () => _changeSelection(0),
              child: TimeUnit('1W', _selection[0])),
          GestureDetector(
              onTap: () => _changeSelection(1),
              child: TimeUnit('1M', _selection[1])),
          GestureDetector(
              onTap: () => _changeSelection(2),
              child: TimeUnit('3M', _selection[2])),
          GestureDetector(
              onTap: () => _changeSelection(3),
              child: TimeUnit('1Y', _selection[3])),
        ],
      ),
    );
  }
}
