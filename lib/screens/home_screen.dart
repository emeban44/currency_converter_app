import 'dart:convert';

import 'package:currency_converter_app/database/boxes.dart';
import 'package:currency_converter_app/helpers/shared_preferences.dart';
import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/models/local_currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/screens/edit_currencies_screen.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_stack.dart';
import 'package:currency_converter_app/widgets/drawer.dart';
import 'package:currency_converter_app/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static final routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      extendBodyBehindAppBar: true,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextButton(
          child: Text('CLICK'),
          onPressed: () {
            final provider = Provider.of<Currencies>(context, listen: false);
            final box = Boxes.getCurrencies();
            final selectedBox = Boxes.getSelected();
            selectedBox.delete('ALL');
            // selectedBox.delete('USD');
            // selectedBox.delete('EUR');
            // SharedPrefs().setAppUsedBefore(false);
            // print(SharedPrefs().getAppUsedBefore);
            // print(box.length);
            // print(selectedBox.values);
            // //provider.setFromCurrency(c);
            // box.deleteAll([0, 1]);
            /* SharedPrefs().setSymbols(provider.getSymbols);
            var s = SharedPrefs().getSymbols;
            Map<String, String> simboli = jsonDecode(s).cast<String, String>();
            print(simboli['USD']); */

            //print(box.isEmpty);
            // var ss = jsonEncode(c.rates);
            // // print(ss);
            // var s = jsonDecode(ss);
            // print(s as Map<String, double>);
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                Navigator.of(context).pushNamed(EditCurrenciesScreen.routeName);
              },
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 3),
                      child: Text('Edit', style: TextStyle(fontSize: 16)),
                    ),
                    Icon(Icons.list),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
