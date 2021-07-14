import 'package:currency_converter_app/models/symbols.dart';
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
          final symbols = currencies.getSymbols;
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                final imagePathVariable =
                    currentCurrencies[i].base.toLowerCase();
                return Container(
                  height: 55,
                  child: Center(
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.indigo),
                            borderRadius: BorderRadius.circular(20)),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                              'assets/images/$imagePathVariable.png'),
                        ),
                      ),
                      title: Text(currentCurrencies[i].base),
                      subtitle: Text(symbols[currentCurrencies[i].base]),
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
