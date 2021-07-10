import 'package:flutter/material.dart';

class AmountInputField extends StatefulWidget {
  final Function(bool toggle, [TextEditingController contr]) _toggleCalc;

  AmountInputField(this._toggleCalc);

  @override
  _AmountInputFieldState createState() => _AmountInputFieldState();
}

class _AmountInputFieldState extends State<AmountInputField> {
  final _controller = TextEditingController();
  bool _alreadyToggled = false;

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
          colors: [Colors.blue.shade50, Colors.blue.shade100],
        ),
      ),
      child: TextFormField(
        readOnly: true,
        showCursor: true,
        controller: _controller,
        focusNode: _node,
        onTap: () {
          //if (_alreadyToggled) return;
          //print(_alreadyToggled);
          // _alreadyToggled = true;
          //_controller.text = '222';
          String tmp = _controller.text;
          print(tmp);
          widget._toggleCalc(true, _controller);
          // _controller.text += 'x ';
          _controller.text = tmp;
          print(tmp);
          _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length));
        },
        style: TextStyle(fontSize: 23),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
