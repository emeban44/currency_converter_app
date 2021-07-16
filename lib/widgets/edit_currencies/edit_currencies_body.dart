import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/widgets/currency_list_view.dart';
import 'package:currency_converter_app/widgets/edit_currencies/search_box.dart';
import 'package:currency_converter_app/widgets/edit_currencies/selected_currencies_sliverlist.dart';
import 'package:currency_converter_app/widgets/edit_currencies/unselected_currencies_sliverlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCurrenciesBody extends StatefulWidget {
  @override
  _EditCurrenciesBodyState createState() => _EditCurrenciesBodyState();
}

class _EditCurrenciesBodyState extends State<EditCurrenciesBody> {
  final GlobalKey<SliverAnimatedListState> _selectedListKey =
      GlobalKey<SliverAnimatedListState>();

  void selectItem(Currency currencyToSelect) {
    // final newIndex =
    //     Provider.of<Currencies>(context, listen: false).getSelected.length - 1;
    final newIndex = 0;
    // print(_selectedListKey.currentState);
    print(newIndex);
    Provider.of<Currencies>(context, listen: false)
        .selectCurrency(currencyToSelect);
    _selectedListKey.currentState.insertItem(newIndex);
    //Provider.of<Currencies>(context,listen: false).
  }

  // void selectItem(Currency currencyToSelect) {
  //   setState(() {
  //     Provider.of<Currencies>(context, listen: false)
  //         .selectCurrency(currencyToSelect);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: SearchBox(),
          ),
          Flexible(
            flex: 10,
            child: CustomScrollView(
              slivers: [
                SelectedCurrenciesSliverList(selectItem, _selectedListKey),
                SliverToBoxAdapter(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                UnselectedCurrenciesSliverList(selectItem),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
