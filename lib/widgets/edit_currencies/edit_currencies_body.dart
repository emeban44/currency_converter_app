import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/widgets/currency_list_view.dart';
import 'package:currency_converter_app/widgets/edit_currencies/search_box.dart';
import 'package:currency_converter_app/widgets/edit_currencies/searched_selected_list.dart';
import 'package:currency_converter_app/widgets/edit_currencies/searched_unselected_list.dart';
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
  GlobalKey<SliverAnimatedListState> _searchedSelectedKey =
      GlobalKey<SliverAnimatedListState>();

  final GlobalKey<SliverAnimatedListState> _unselectedListKey =
      GlobalKey<SliverAnimatedListState>();
  GlobalKey<SliverAnimatedListState> _searchedUnselectedKey =
      GlobalKey<SliverAnimatedListState>();

  bool _isSearching = false;

  void selectItem(Currency currencyToSelect) {
    final newIndex = 0;
    Provider.of<Currencies>(context, listen: false)
        .selectCurrency(currencyToSelect);
    _selectedListKey.currentState.insertItem(newIndex);
  }

  void selectSearchedItem(Currency currencyToSelect) {
    final newIndex = 0;
    Provider.of<Currencies>(context, listen: false)
        .selectSearchedCurrency(currencyToSelect);
    _searchedSelectedKey.currentState.insertItem(newIndex);
  }

  void unselectSearchedItem(Currency currencyToUnselect) {
    final newIndex = 0;
    Provider.of<Currencies>(context, listen: false)
        .unselectSearchedCurrency(currencyToUnselect);
    _searchedUnselectedKey.currentState.insertItem(newIndex);
  }

  void unselectItem(Currency currencyToUnselect) {
    final newIndex = 0;
    Provider.of<Currencies>(context, listen: false)
        .unselectCurrency(currencyToUnselect);
    _unselectedListKey.currentState.insertItem(newIndex);
  }

  void setSearchingState(String searchedText, bool shouldSearch) {
    setState(() {
      //  print('SETTING BODY STATE');
      _isSearching = shouldSearch;
      _searchedSelectedKey = GlobalKey<SliverAnimatedListState>();
      _searchedUnselectedKey = GlobalKey<SliverAnimatedListState>();
      //  _selectedListKey =
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
                ? CustomScrollView(
                    slivers: [
                      SearchedSelectedList(
                          unselectSearchedItem, _searchedSelectedKey),
                      SliverToBoxAdapter(child: Divider(thickness: 2)),
                      SearchedUnselectedList(
                          selectSearchedItem, _searchedUnselectedKey),
                    ],
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
