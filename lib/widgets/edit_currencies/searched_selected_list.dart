import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/widgets/edit_currencies/selected_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchedSelectedList extends StatefulWidget {
  final Function(Currency currency) rebuildState;
  final GlobalKey<SliverAnimatedListState> _globalKey;
  SearchedSelectedList(this.rebuildState, this._globalKey);
  @override
  _SearchedSelectedListState createState() => _SearchedSelectedListState();
}

class _SearchedSelectedListState extends State<SearchedSelectedList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Currencies>(
        builder: (context, currencies, child) {
          List<Currency> selected = currencies.getSearchedSelected;
          return SliverAnimatedList(
              key: widget._globalKey,
              initialItemCount: selected.length,
              itemBuilder: (context, i, animation) {
                final imagePathVariable = selected[i].base.toLowerCase();
                return ScaleTransition(
                  scale: animation,
                  key: ValueKey(imagePathVariable),
                  child: SelectedListTile(
                    i: i,
                    base: selected[i].base,
                    path: imagePathVariable,
                    symbol: currencies.getSymbols[selected[i].base],
                    onPress: () {
                      widget._globalKey.currentState.removeItem(
                          i,
                          (context, animation) => SizeTransition(
                                sizeFactor: animation,
                                // key: ValueKey(selected[i].base),
                                child: SelectedListTile(
                                  base: selected[i].base,
                                  i: i,
                                  path: imagePathVariable,
                                  symbol:
                                      currencies.getSymbols[selected[i].base],
                                ),
                              ));
                      widget.rebuildState(selected[i]);
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
