import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/widgets/edit_currencies/unselected_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnselectedCurrenciesSliverList extends StatefulWidget {
  final Function(Currency currency) selectItem;
  final GlobalKey<SliverAnimatedListState> _listKey;
  UnselectedCurrenciesSliverList(this.selectItem, this._listKey);

  @override
  _UnselectedCurrenciesSliverListState createState() =>
      _UnselectedCurrenciesSliverListState();
}

class _UnselectedCurrenciesSliverListState
    extends State<UnselectedCurrenciesSliverList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Currencies>(
        builder: (context, currencies, child) {
          return SliverAnimatedList(
            key: widget._listKey,
            initialItemCount: currencies.getCurrencies.length,
            itemBuilder: (context, i, animation) {
              List<Currency> unselectedCurrencies = currencies.getCurrencies;
              final imagePathVariable =
                  unselectedCurrencies[i].base.toLowerCase();
              return ScaleTransition(
                scale: animation,
                child: UnselectedListTile(
                  i: i,
                  base: unselectedCurrencies[i].base,
                  path: imagePathVariable,
                  symbol: currencies.getSymbols[unselectedCurrencies[i].base],
                  onPress: () {
                    widget._listKey.currentState.removeItem(
                      i,
                      (context, animation) => ScaleTransition(
                          /* SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset.zero,
                            end: const Offset(1.5, 0.0),
                          ).animate(CurvedAnimation(
                            parent: animation,
                            curve: Curves.elasticIn,
                          ))
                          // sizeFactor: animation, */
                          scale: animation,
                          key: ValueKey(unselectedCurrencies[i].base),
                          child: UnselectedListTile(
                            i: i,
                            base: unselectedCurrencies[i].base,
                            path: imagePathVariable,
                            symbol: currencies
                                .getSymbols[unselectedCurrencies[i].base],
                          )),
                    );

                    widget.selectItem(unselectedCurrencies[i]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
