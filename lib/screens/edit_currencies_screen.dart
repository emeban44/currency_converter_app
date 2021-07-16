import 'package:currency_converter_app/widgets/edit_currencies/edit_currencies_body.dart';
import 'package:flutter/material.dart';

class EditCurrenciesScreen extends StatelessWidget {
  static const routeName = '/edit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Currencies'),
        backgroundColor: Colors.indigo.shade400,
      ),
      body: EditCurrenciesBody(),
    );
  }
}
