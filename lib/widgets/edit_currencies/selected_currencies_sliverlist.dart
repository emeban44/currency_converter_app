import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedCurrenciesSliverList extends StatelessWidget {
  final Function(Currency currency) rebuildState;
  SelectedCurrenciesSliverList(this.rebuildState);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Currencies>(
        builder: (context, currencies, child) {
          List<Currency> selected = currencies.getSelected;
          if (selected.isEmpty)
            return SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
                child: Center(
                  child: Text('None selected yet.'),
                ),
              ),
            );
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, i) {
                final imagePathVariable = selected[i].base.toLowerCase();
                return ListTile(
                  key: ValueKey(selected[i].base),
                  leading: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.indigo),
                        borderRadius: BorderRadius.circular(21)),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/images/$imagePathVariable.png'),
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
                            selected[i].base,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.only(left: 7.5),
                            child: Text(
                              currencies.getSymbols[selected[i].base],
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
                      Icons.remove_circle,
                      color: Colors.red,
                      size: 27,
                    ),
                  ),
                );
              },
              childCount: currencies.getSelected.length,
            ),
          );
        },
      ),
    );
  }
}
