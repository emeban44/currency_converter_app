import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionOutputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Currencies>(builder: (ctx, currencies, _) {
      final double screenHeight = MediaQuery.of(context).size.height;
      return Container(
        height: screenHeight > 800
            ? 106
            : 100, //MediaQuery.of(context).size.height * 0.12,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                currencies.getAmount.toString() +
                    ' ' +
                    currencies.getFromCurrency.base +
                    ' =',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
            ),
            Flexible(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (currencies.getAmount *
                                  currencies.getFromCurrency
                                      .rates[currencies.getToCurrency.base])
                              .toStringAsFixed(2) +
                          ' ',
                      style: TextStyle(fontSize: 45, color: Colors.white),
                    ),
                    Text(
                      (currencies.getToCurrency.base),
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      );
    });
  }
}
