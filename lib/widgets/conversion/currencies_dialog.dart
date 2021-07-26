import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyDialog extends StatelessWidget {
  final Currencies provider;
  final String title;
  CurrencyDialog(this.provider, this.title);
  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.width);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 37.5),
      child: SimpleDialog(
        contentPadding: const EdgeInsets.all(0),
        titlePadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.all(0),
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              height: provider.getHomeSelected.length.toDouble() * 55,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  final imagePathVariable =
                      provider.getHomeSelected[i].base.toLowerCase();
                  final selected = provider.getHomeSelected;
                  return SimpleDialogOption(
                    padding: const EdgeInsets.all(0),
                    onPressed: title == 'From'
                        ? () {
                            provider.setFromCurrency(selected[i]);
                            Navigator.of(context).pop();
                          }
                        : () {
                            provider.setToCurrency(selected[i]);
                            Navigator.of(context).pop();
                          },
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 0.5, color: Colors.blueGrey))),
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 7.5,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.indigo),
                                      borderRadius: BorderRadius.circular(21)),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        'assets/images/$imagePathVariable.png'),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 5, right: 7.5),
                                  child: Text(
                                    selected[i].base,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                      provider.getSymbols[selected[i].base],
                                      style: TextStyle(fontSize: 11)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: provider.getHomeSelected.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
