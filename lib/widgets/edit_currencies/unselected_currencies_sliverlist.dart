import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/widgets/edit_currencies/currency_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnselectedCurrenciesSliverList extends StatefulWidget {
  final Function(Currency currency) selectItem;
  UnselectedCurrenciesSliverList(this.selectItem);

  @override
  _UnselectedCurrenciesSliverListState createState() =>
      _UnselectedCurrenciesSliverListState();
}

class _UnselectedCurrenciesSliverListState
    extends State<UnselectedCurrenciesSliverList> {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();

  void removeSliverListTile() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<Currencies>(
        builder: (context, currencies, child) {
          return SliverAnimatedList(
            key: _listKey,
            initialItemCount: currencies.getCurrencies.length,
            itemBuilder: (context, i, animation) {
              List<Currency> unselectedCurrencies = currencies.getCurrencies;
              final imagePathVariable =
                  unselectedCurrencies[i].base.toLowerCase();
              return SizeTransition(
                // sizeFactor: animation,
                sizeFactor: animation,
                child: CustomListTile(
                  i: i,
                  base: unselectedCurrencies[i].base,
                  path: imagePathVariable,
                  symbol: currencies.getSymbols[unselectedCurrencies[i].base],
                  onPress: () {
                    _listKey.currentState.removeItem(
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
                          child: CustomListTile(
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
                // child: InkWell(
                //   splashColor: Colors.indigo,
                //   onTap: () {
                //     // widget.rebuildState(unselectedCurrencies[i]);

                //     SliverAnimatedList.of(context).removeItem(
                //         i,
                //         (context, animation) =>
                //             SizeTransition(sizeFactor: animation));
                //   },
                //   child: Container(
                //     child: ListTile(
                //       key: ValueKey(unselectedCurrencies[i].base),
                //       leading: Container(
                //         decoration: BoxDecoration(
                //             border: Border.all(width: 1, color: Colors.indigo),
                //             borderRadius: BorderRadius.circular(21)),
                //         child: CircleAvatar(
                //           radius: 20,
                //           backgroundImage: AssetImage(
                //               'assets/images/$imagePathVariable.png'),
                //         ),
                //       ),
                //       title: Container(
                //         child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           // mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Flexible(
                //               flex: 1,
                //               child: Text(
                //                 unselectedCurrencies[i].base,
                //                 style: TextStyle(
                //                     fontWeight: FontWeight.bold, fontSize: 20),
                //               ),
                //             ),
                //             Flexible(
                //               flex: 2,
                //               child: Container(
                //                 padding: const EdgeInsets.only(left: 7.5),
                //                 child: Text(
                //                   currencies
                //                       .getSymbols[unselectedCurrencies[i].base],
                //                   style: TextStyle(fontSize: 14),
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //       trailing: IconButton(
                //         onPressed: () {},
                //         icon: Icon(
                //           Icons.add_circle_outlined,
                //           color: Colors.green,
                //           size: 27,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              );
            },
          );
        },
      ),
    );
  }
}
