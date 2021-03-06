import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/screens/chart_screen.dart';
import 'package:currency_converter_app/widgets/conversion/currencies_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionColumn extends StatelessWidget {
  final String title;
  ConversionColumn(this.title);
  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.width);
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
                child: Text(title,
                    style: TextStyle(color: Colors.white, fontSize: 14))),
          ),
          Flexible(
              child: InkWell(
            onTap: () {
              if (Provider.of<Currencies>(context, listen: false)
                  .getHomeSelected
                  .isEmpty) {
                return;
              }
              showDialog(
                  context: context,
                  builder: (ctx) {
                    final provider = Provider.of<Currencies>(context);
                    return CurrencyDialog(provider, title);
                  });
            },
            child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width > 405
                    ? 150
                    : MediaQuery.of(context).size.width < 380
                        ? 135
                        : 140,
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
                    colors: [Colors.white, Colors.blue.shade50],
                  ),
                ),
                child: Consumer<Currencies>(builder: (ctx, currencies, _) {
                  final Currency currency = title == 'From'
                      ? currencies.getFromCurrency
                      : currencies.getToCurrency;
                  final imagePathVariable = currency.base.toLowerCase();
                  //print(MediaQuery.of(context).size.width);
                  final provider =
                      Provider.of<Currencies>(context, listen: false);
                  return Container(
                      padding: const EdgeInsets.all(6),
                      child: Stack(children: [
                        Container(
                          margin: const EdgeInsets.only(left: 1),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.indigo),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: CircleAvatar(
                            radius: 17,
                            backgroundImage: AssetImage(
                                'assets/images/$imagePathVariable.png'),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Text(
                              currency.base,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 1,
                          top: 4.5,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(ChartScreen.routeName, arguments: [
                                provider.getFromCurrency.base,
                                provider.getToCurrency.base,
                              ]);
                            },
                            child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.insert_chart_outlined,
                                  size: 28,
                                )),
                          ),
                        )
                      ]));
                })),
          )),
          Flexible(
            child: Consumer<Currencies>(builder: (ctx, currencies, _) {
              bool isBitcoin = false;
              if (title == 'From') {
                if (currencies.getFromCurrency.base == 'BTC') isBitcoin = true;
              } else if (title == 'To') {
                if (currencies.getToCurrency.base == 'BTC') isBitcoin = true;
              }
              return Container(
                  margin: isBitcoin
                      ? const EdgeInsets.only(top: 7.5)
                      : const EdgeInsets.only(top: 5),
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
                          style: isBitcoin
                              ? TextStyle(color: Colors.white, fontSize: 12)
                              : TextStyle(color: Colors.white))
                      : Text(
                          '1 ' +
                              currencies.getToCurrency.base +
                              ' = ' +
                              currencies.getToCurrency
                                  .rates[currencies.getFromCurrency.base]
                                  .toStringAsFixed(2) +
                              ' ' +
                              currencies.getFromCurrency.base,
                          style: isBitcoin
                              ? TextStyle(color: Colors.white, fontSize: 12)
                              : TextStyle(color: Colors.white)));
            }),
          ),
        ],
      ),
    );
  }
}
