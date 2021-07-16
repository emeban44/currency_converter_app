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
  void rebuildState(Currency currencyToSelect) {
    setState(() {
      Provider.of<Currencies>(context, listen: false)
          .selectCurrency(currencyToSelect);
    });
  }

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
                SelectedCurrenciesSliverList(rebuildState),
                SliverToBoxAdapter(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                UnselectedCurrenciesSliverList(rebuildState),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
