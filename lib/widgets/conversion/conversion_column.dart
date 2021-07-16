import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionColumn extends StatelessWidget {
  final String title;
  ConversionColumn(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
                child: Text(title, style: TextStyle(color: Colors.white))),
          ),
          Flexible(
              child: Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 1.0,
                          offset: Offset(0.5, 0.5)),
                    ],
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade50, Colors.blue.shade100],
                    ),
                  ),
                  child: Consumer<Currencies>(builder: (ctx, currencies, _) {
                    final Currency currency = title == 'From'
                        ? currencies.getFromCurrency
                        : currencies.getToCurrency;
                    final imagePathVariable = currency.base.toLowerCase();
                    final provider =
                        Provider.of<Currencies>(context, listen: false);
                    return GestureDetector(
                        onTap: title == 'To'
                            ? () {
                                provider.setToCurrency(provider.getCurrencies
                                    .firstWhere((e) => (e.base == 'USD')));
                              }
                            : null,
                        child: Container(
                            padding: const EdgeInsets.all(6),
                            child: Row(children: [
                              Container(
                                margin: const EdgeInsets.only(left: 1),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.indigo),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundImage: AssetImage(
                                      'assets/images/$imagePathVariable.png'),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: Text(
                                  currency.base,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueGrey.shade900,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child:
                                      Icon(Icons.insert_chart_outlined_sharp))
                            ])));
                  }))),
          Flexible(
            child: Consumer<Currencies>(builder: (ctx, currencies, _) {
              return Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: title == 'From'
                      ? Text(
                          '1 ' +
                              currencies.getFromCurrency.base +
                              ' = ' +
                              currencies.getFromCurrency
                                  .rates[currencies.getToCurrency.base]
                                  .toStringAsFixed(2) +
                              ' ' +
                              currencies.getToCurrency.base,
                          style: TextStyle(color: Colors.white))
                      : Text(
                          '1 ' +
                              currencies.getToCurrency.base +
                              ' = ' +
                              currencies.getToCurrency
                                  .rates[currencies.getFromCurrency.base]
                                  .toStringAsFixed(2) +
                              ' ' +
                              currencies.getFromCurrency.base,
                          style: TextStyle(color: Colors.white)));
            }),
          ),
        ],
      ),
    );
  }
}
