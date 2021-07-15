import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionOutputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Currencies>(builder: (ctx, currencies, _) {
      return Container(
        height: 100,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                currencies.getAmount.toStringAsFixed(0) +
                    ' ' +
                    currencies.getFromCurrency.base,
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            Expanded(
              child: Text(
                '= ' +
                    (currencies.getAmount *
                            currencies.getFromCurrency.rates['USD'])
                        .toStringAsFixed(2) +
                    ' ' +
                    currencies.getToCurrency.base,
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ],
        )),
      );
    });
  }
}
