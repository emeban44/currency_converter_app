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
          if (_text == 'C' && _controller.text.isNotEmpty) {
            _controller.text =
                _controller.text.substring(0, _controller.text.length - 1);
          } else if (_text != 'C') {
            _controller.text += _text;
          } else if (_text == 'x') {
            String string = _controller.text;
            double broj = double.parse(string);
            // broj = broj * 5;
            // _controller.text = broj.toString();
          }
          _controller.selection = TextSelection.fromPosition(
            TextPosition(
              offset: _controller.text.length,
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 85,
          decoration: BoxDecoration(
              gradient: _isDarker
                  ? LinearGradient(
                      colors: [
                        Colors.indigo.shade300,
                        //   Colors.indigo.shade300,
                        //  Colors.indigo.shade300,
                        //      Colors.indigo.shade300,
                        Colors.blueGrey.shade600,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : null,
              color: !_isDarker ? Colors.indigo.shade200 : null),
          child: Center(
              child: Text(_text,
                  style: TextStyle(
                      fontSize: 35,
                      color: _isDarker ? Colors.white : Colors.black))),
        ),
      ),
    );
  }
}
