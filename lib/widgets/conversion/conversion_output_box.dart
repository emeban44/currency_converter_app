import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionOutputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Currencies>(builder: (ctx, currencies, _) {
      final double screenHeight = MediaQuery.of(context).size.height;
      //print(screenHeight);
      return Container(
        height: screenHeight > 880
            ? 120
            : screenHeight > 815
                ? 106
                : 96, //MediaQuery.of(context).size.height * 0.12,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.black26,
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
                currencies.getAmount.toStringAsFixed(2) +
                    ' ' +
                    currencies.getFromCurrency.base +
                    ' =',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            Flexible(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        (currencies.getAmount *
                                    currencies.getFromCurrency
                                        .rates[currencies.getToCurrency.base])
                                .toStringAsFixed(2) +
                            ' ',
                        style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          (currencies.getToCurrency.base),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
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
