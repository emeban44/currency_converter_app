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
                return InkWell(
                  splashColor: Colors.indigo.shade200,
                  onTap: () {
                    Provider.of<Currencies>(context, listen: false)
                        .setFromCurrency(currentCurrencies[i]);
                  },
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 0.5, color: Colors.blueGrey))),
                    child: Center(
                      child: ListTile(
                        //   contentPadding: EdgeInsets.only(bottom: 5),
                        dense: true,
                        visualDensity: VisualDensity(vertical: -1.5),
                        leading: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.indigo),
                              borderRadius: BorderRadius.circular(21)),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                                'assets/images/$imagePathVariable.png'),
                          ),
                        ),
                        title: Text(
                          currentCurrencies[i].base,
                          style: TextStyle(fontSize: 19),
                        ),
                        subtitle: Text(
                          symbols[currentCurrencies[i].base],
                          style: TextStyle(fontSize: 14),
                        ),
                        trailing:
                            Text(currentCurrencies[i].rates['BAM'].toString()),
                      ),
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
