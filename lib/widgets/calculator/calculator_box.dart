import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorBox extends StatelessWidget {
  final String _text;
  final bool _isDarker;
  final TextEditingController _controller;
  CalculatorBox(this._text, this._isDarker, this._controller);

  void setNumberAfterOperation(String operation, BuildContext ctx) {
    final provider = Provider.of<Currencies>(ctx, listen: false);
    provider.addOperation(operation);
    provider.restartHelper();
    provider.expandHelper(_text);
    provider.addCalculatorNumber(double.parse(provider.getHelper));
    _controller.text += _text;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: () {
          final provider = Provider.of<Currencies>(context, listen: false);

          // numbers
          if (_text != 'C' &&
              _text != 'x' &&
              _text != '/' &&
              _text != '-' &&
              _text != '+') {
            if (_text == '.') {
              if (_controller.text.isEmpty)
                return;
              else if (provider.getHelper.contains('.')) return;
            }
            if (_controller.text.endsWith('x') && _text != '.') {
              setNumberAfterOperation('x', context);
            } else if (_controller.text.endsWith('/') && _text != '.') {
              setNumberAfterOperation('/', context);
            } else if (_controller.text.endsWith('-') && _text != '.') {
              setNumberAfterOperation('-', context);
            } else if (_controller.text.endsWith('+') && _text != '.') {
              setNumberAfterOperation('+', context);
            } else {
              _controller.text += _text;
              provider.expandHelper(_text);
              double numberToAdd = double.parse(provider.getHelper);
              provider.updateNumbers(numberToAdd);
            }
          }

          // backspace
          else if (_text == 'C') {
            // print(provider.getHelper);
            if (_controller.text.isEmpty)
              return;
            else if (_controller.text.length == 1) {
              _controller.text = '';
              provider.restartAmount();
              provider.restartHelper();
            } else if (_controller.text.endsWith('.')) {
              provider.reduceHelper();
              _controller.text =
                  _controller.text.substring(0, _controller.text.length - 1);
            } else if (_controller.text.endsWith('x') ||
                _controller.text.endsWith('-') ||
                _controller.text.endsWith('+') ||
                _controller.text.endsWith('/')) {
              provider.removeLastHelper();
              _controller.text =
                  _controller.text.substring(0, _controller.text.length - 1);
            } else {
              if (provider.getHelper.length == 1) {
                provider.removeLastOperation();
                provider.removeLastNumber();
                provider.rewindHelper(_controller.text);
              } else {
                provider.reduceHelper();
                provider.updateNumbers(double.parse(provider.getHelper));
              }
              _controller.text =
                  _controller.text.substring(0, _controller.text.length - 1);
            }
          }

          // operations
          else {
            if (_controller.text.isEmpty) return;
            if (_controller.text.endsWith('x')) {
              return;
            } else if (_controller.text.endsWith('/')) {
              return;
            } else if (_controller.text.endsWith('-')) {
              return;
            } else if (_controller.text.endsWith('+')) {
              return;
            }
            provider.addHelper(provider.getHelper);
            _controller.text += _text;
          }

          provider.setAmount();
          //print(provider.getHelper);
          print(provider.getHelperHistory);
          print(provider.getHelper);
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
