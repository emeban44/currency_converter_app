import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      child: Consumer<Currencies>(
        builder: (ctx, currencies, _) {
          final currentCurrencies = currencies.getCurrencies;
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                return Container(
                  height: 55,
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text(currentCurrencies[i].base),
                      trailing:
                          Text(currentCurrencies[i].rates['BAM'].toString()),
                    ),
                  ),
                );
              },
              itemCount: currentCurrencies.length,
            ),
          );
        },
      ),
    );
  }
}
