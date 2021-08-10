import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmountInputField extends StatefulWidget {
  final Function(bool toggle, [TextEditingController contr]) _toggleCalc;
  final bool _displayCalc;
  AmountInputField(this._toggleCalc, this._displayCalc);

  @override
  _AmountInputFieldState createState() => _AmountInputFieldState();
}

class _AmountInputFieldState extends State<AmountInputField> {
  final _controller = TextEditingController();
  bool _alreadyToggled = false;

  void setStartingAmount() {
    _controller.text = '1';
  }

  @override
  void initState() {
    //setStartingAmount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode _node;
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blue.shade50],
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextFormField(
              readOnly: true,
              showCursor: true,
              //initialValue: '1.00',
              controller: _controller,
              focusNode: _node,
              onTap: () {
                String tmp = _controller.text;
                widget._toggleCalc(true, _controller);
                _controller.text = tmp;
                _controller.selection = TextSelection.fromPosition(
                    TextPosition(offset: _controller.text.length));
              },
              style: TextStyle(fontSize: 26),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '1.00',
                hintStyle: TextStyle(fontSize: 26),
              ),
            ),
          ),
          if (widget._displayCalc)
            Positioned(
              child: IconButton(
                onPressed: () {
                  _controller.clear();
                  // widget._toggleCalc(false);
                  Provider.of<Currencies>(context, listen: false)
                      .restartAmount();
                },
                icon: Icon(Icons.highlight_remove_outlined),
              ),
              right: 0,
              height: 48,
            )
        ],
      ),
    );
  }
}
