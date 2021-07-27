import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DoneButton extends StatelessWidget {
  final Function(bool toggle) _toggleCalc;
  final TextEditingController _controller;
  DoneButton(this._toggleCalc, this._controller);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Flexible(
      child: InkWell(
        onTap: () => _toggleCalc(false),
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          width: double.infinity,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 71, 112, 1),
          ),
          child: Text('DONE',
              style: TextStyle(
                  fontSize: screenHeight * 0.03, color: Colors.white)),
        ),
      ),
    );
  }
}
