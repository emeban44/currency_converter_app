import 'package:currency_converter_app/widgets/calculator/custom_calculator.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_stack.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _displayCalculator = false;
  var _textEditingController = TextEditingController();
  bool _alreadyToggled = false;
  void _toggleCalculator(bool current, [TextEditingController controller]) {
    if (current && _displayCalculator) {
      _alreadyToggled = true;
      print(controller.text);
    } else if (current && !_displayCalculator)
      setState(() {
        _displayCalculator = current;
        _textEditingController = controller;
        _alreadyToggled = true;
      });
    else if (!current && _displayCalculator) {
      setState(() {
        _displayCalculator = current;
        _textEditingController = controller;
        _alreadyToggled = false;
      });
    }
    // print(_alreadyToggled);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: ConversionStack(_toggleCalculator), fit: FlexFit.loose),
        if (_displayCalculator)
          Flexible(
              child:
                  CustomCalculator(_toggleCalculator, _textEditingController),
              fit: FlexFit.loose),
      ],
    );
  }
}
