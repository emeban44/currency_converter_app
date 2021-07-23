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
          final currentCurrencies = currencies.getSelected;
          final symbols = currencies.getSymbols;
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              itemBuilder: (ctx, i) {
                final imagePathVariable =
                    currentCurrencies[i].base.toLowerCase();
                bool isBitcoin = false;
                if (currencies.getFromCurrency.base == 'BTC') isBitcoin = true;
                return InkWell(
                  splashColor: Colors.indigo.shade200,
                  onTap: () {
                    Provider.of<Currencies>(context, listen: false)
                        .setFromCurrency(currentCurrencies[i]);
                  },
                  child: Container(
                    height: 66,
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 0.5, color: Colors.blueGrey))),
                    child: ListTile(
                      //   contentPadding: EdgeInsets.only(bottom: 5),
                      dense: true,
                      visualDensity: VisualDensity(vertical: -0.25),
                      leading: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.indigo),
                            borderRadius: BorderRadius.circular(21)),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                              'assets/images/$imagePathVariable.png'),
                        ),
                      ),
                      title: Text(
                        currentCurrencies[i].base,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        symbols[currentCurrencies[i].base],
                        style: TextStyle(fontSize: 13),
                      ),
                      trailing: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                (currencies.getFromCurrency.rates[
                                                currentCurrencies[i].base] *
                                            currencies.getAmount)
                                        .toStringAsFixed(2) +
                                    ' ' +
                                    currentCurrencies[i].base,
                                style: isBitcoin
                                    ? TextStyle(fontSize: 17)
                                    : TextStyle(fontSize: 20),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '1 ' +
                                    currentCurrencies[i].base +
                                    ' = ' +
                                    currentCurrencies[i]
                                        .rates[currencies.getFromCurrency.base]
                                        .toStringAsFixed(2) +
                                    ' ' +
                                    currencies.getFromCurrency.base,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
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
