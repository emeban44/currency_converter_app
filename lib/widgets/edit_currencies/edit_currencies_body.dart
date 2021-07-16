import 'package:currency_converter_app/widgets/edit_currencies/search_box.dart';
import 'package:flutter/material.dart';

class EditCurrenciesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SearchBox(),
        ],
      ),
    );
  }
}
