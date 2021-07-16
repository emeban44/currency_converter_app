import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnselectedCurrenciesSliverList extends StatelessWidget {
  final Function(Currency currency) rebuildState;
  UnselectedCurrenciesSliverList(this.rebuildState);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Currencies>(
        builder: (context, currencies, child) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, i) {
                List<Currency> unselectedCurrencies = currencies.getCurrencies;
                final imagePathVariable =
                    unselectedCurrencies[i].base.toLowerCase();
                return InkWell(
                  splashColor: Colors.indigo,
                  onTap: () {
                    rebuildState(unselectedCurrencies[i]);
                  },
                  child: Container(
                    child: ListTile(
                      key: ValueKey(unselectedCurrencies[i].base),
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
                      title: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                unselectedCurrencies[i].base,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.only(left: 7.5),
                                child: Text(
                                  currencies
                                      .getSymbols[unselectedCurrencies[i].base],
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_outlined,
                          color: Colors.green,
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: currencies.getCurrencies.length,
            ),
          );
        },
      ),
    );
  }
}
