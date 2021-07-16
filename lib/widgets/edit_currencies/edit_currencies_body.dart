import 'package:currency_converter_app/widgets/currency_list_view.dart';
import 'package:currency_converter_app/widgets/edit_currencies/search_box.dart';
import 'package:currency_converter_app/widgets/edit_currencies/selected_currencies_listview.dart';
import 'package:currency_converter_app/widgets/edit_currencies/unselected_currencies_listview.dart';
import 'package:flutter/material.dart';

class EditCurrenciesBody extends StatelessWidget {
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
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height - 50,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      child: SelectedCurrencies(),
                    ),
                    Divider(thickness: 5),
                    Expanded(
                      child: UnselectedCurrencies(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
