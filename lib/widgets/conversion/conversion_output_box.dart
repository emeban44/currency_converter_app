import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ConversionOutputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Currencies>(builder: (ctx, currencies, _) {
      final double screenHeight = MediaQuery.of(context).size.height;
      print(screenHeight);
      return GestureDetector(
        onTap: () {
          Clipboard.setData(ClipboardData(
              text: currencies.getAmount.toStringAsFixed(2) +
                  ' ' +
                  currencies.getFromCurrency.base +
                  ' = ' +
                  (currencies.getAmount *
                          currencies.getFromCurrency
                              .rates[currencies.getToCurrency.base])
                      .toStringAsFixed(2) +
                  ' ' +
                  currencies.getToCurrency.base));
          showToast(
            'Copied to clipboard',
            borderRadius: BorderRadius.circular(15),
            textStyle: TextStyle(fontSize: 25, color: Colors.white),
            context: context,
            animation: StyledToastAnimation.scale,
            reverseAnimation: StyledToastAnimation.fade,
            position: StyledToastPosition.bottom,
            animDuration: Duration(seconds: 1),
            duration: Duration(seconds: 3),
            curve: Curves.elasticOut,
            reverseCurve: Curves.linear,
          );
        },
        child: Container(
          height: screenHeight > 920
              ? 130
              : screenHeight > 880
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
                child: FittedBox(
                  child: Text(
                    currencies.getAmount.toStringAsFixed(2) +
                        ' ' +
                        currencies.getFromCurrency.base +
                        ' =',
                    style: TextStyle(
                        fontSize: screenHeight > 910 ? 40 : 32,
                        color: Colors.white),
                  ),
                ),
              ),
              Flexible(
                child: FittedBox(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            (currencies.getAmount *
                                        currencies.getFromCurrency.rates[
                                            currencies.getToCurrency.base])
                                    .toStringAsFixed(2) +
                                ' ',
                            style: TextStyle(
                                fontSize: screenHeight > 910
                                    ? 56
                                    : screenHeight > 840
                                        ? 50
                                        : 45,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom: screenHeight > 910
                                    ? 4
                                    : screenHeight > 840 && screenHeight < 900
                                        ? 7.5
                                        : screenHeight < 820 &&
                                                screenHeight > 800
                                            ? 5
                                            : screenHeight < 800
                                                ? 6
                                                : screenHeight * 0.001),
                            child: Text(
                              (currencies.getToCurrency.base),
                              style: TextStyle(
                                  fontSize: screenHeight > 910 ? 42 : 30,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      );
    });
  }
}
