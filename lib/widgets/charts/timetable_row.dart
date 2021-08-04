import 'package:currency_converter_app/widgets/charts/time_unit.dart';
import 'package:flutter/material.dart';

class TimeTableRow extends StatefulWidget {
  final List<bool> _selection;
  final Function(int i) _changeSelection;
  TimeTableRow(this._selection, this._changeSelection);
  @override
  _TimeTableRowState createState() => _TimeTableRowState();
}

class _TimeTableRowState extends State<TimeTableRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 7.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: () => widget._changeSelection(0),
              child: TimeUnit('1W', widget._selection[0])),
          GestureDetector(
              onTap: () => widget._changeSelection(1),
              child: TimeUnit('1M', widget._selection[1])),
          GestureDetector(
              onTap: () => widget._changeSelection(2),
              child: TimeUnit('3M', widget._selection[2])),
          GestureDetector(
              onTap: () => widget._changeSelection(3),
              child: TimeUnit('1Y', widget._selection[3])),
        ],
      ),
    );
  }
}
