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

  final GlobalKey<SliverAnimatedListState> _unselectedListKey =
      GlobalKey<SliverAnimatedListState>();

  bool _isSearching = false;

  void selectItem(Currency currencyToSelect) {
    final newIndex = 0;
    Provider.of<Currencies>(context, listen: false)
        .selectCurrency(currencyToSelect);
    _selectedListKey.currentState.insertItem(newIndex);
  }

  void unselectItem(Currency currencyToUnselect) {
    final newIndex = 0;
    Provider.of<Currencies>(context, listen: false)
        .unselectCurrency(currencyToUnselect);
    _unselectedListKey.currentState.insertItem(newIndex);
  }

  void setSearchingState(String searchedText, bool shouldSearch) {
    setState(() {
      _isSearching = shouldSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: SearchBox(setSearchingState),
          ),
          Flexible(
            flex: 10,
            child: _isSearching
                ? Center(
                    child: Text('SEARCHING'),
                  )
                : CustomScrollView(
                    slivers: [
                      SelectedCurrenciesSliverList(
                          unselectItem, _selectedListKey),
                      SliverToBoxAdapter(child: Divider(thickness: 2)),
                      UnselectedCurrenciesSliverList(
                          selectItem, _unselectedListKey),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
