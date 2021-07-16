import 'package:currency_converter_app/widgets/edit_currencies/search_box.dart';
import 'package:flutter/material.dart';

class EditCurrenciesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        children: [
          SearchBox(),
        ],
      ),
    );
  }
}
