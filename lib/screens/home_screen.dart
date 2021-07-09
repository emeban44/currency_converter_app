import 'package:currency_converter_app/widgets/conversion_stack.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConversionStack(),
    );
  }
}
