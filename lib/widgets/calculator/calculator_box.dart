import 'package:flutter/material.dart';

class CalculatorBox extends StatelessWidget {
  final String _text;
  final bool _isDarker;
  final TextEditingController _controller;
  CalculatorBox(this._text, this._isDarker, this._controller);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: () {
          _controller.text += ' x ';
          _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length));
        },
        child: Container(
          width: double.infinity,
          height: 85,
          decoration: BoxDecoration(
              gradient: _isDarker
                  ? LinearGradient(
                      colors: [
                        Colors.indigo.shade300,
                        Colors.indigo.shade300,
                        Colors.indigo.shade300,
                        Colors.indigo.shade300,
                        Colors.blueGrey.shade600,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : null,
              color: !_isDarker ? Colors.indigo.shade200 : null),
          child: Center(child: Text(_text, style: TextStyle(fontSize: 35))),
        ),
      ),
    );
  }
}
