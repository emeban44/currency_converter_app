import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedCurrenciesSliverList extends StatefulWidget {
  final Function(Currency currency) rebuildState;
  final GlobalKey<SliverAnimatedListState> _globalKey;
  SelectedCurrenciesSliverList(this.rebuildState, this._globalKey);

  @override
  _SelectedCurrenciesSliverListState createState() =>
      _SelectedCurrenciesSliverListState();
}

class _SelectedCurrenciesSliverListState
    extends State<SelectedCurrenciesSliverList> {
  void insertItem() {
    // final newIndex = Provider.of<Currencies>(context, listen: false).getSelected.length - 1;
    final newIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Currencies>(
        builder: (context, currencies, child) {
          List<Currency> selected = currencies.getSelected;
          // print(widget._globalKey.currentState.mounted);

          return SliverAnimatedList(
              key: widget._globalKey,
              initialItemCount: selected.length,
              itemBuilder: (context, i, animation) {
                //print(widget._globalKey.currentState.mounted);
                //print(selected[i]);
                // if (selected.isEmpty)
                //   return ListTile(
                // height: 40,

                // );
                // if (selected.isEmpty) {
                //   return SliverFillRemaining(
                //     child: Text('NONE'),
                //   );
                // }
                // print(currencies.getSelected);
                // print(i);
                final imagePathVariable = selected[i].base.toLowerCase();
                return ScaleTransition(
                    scale: animation,
                    child: ListTile(
                      key: ValueKey(selected[i].base),
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
                    ));
              });
        },
      ),
    );
  }
}
