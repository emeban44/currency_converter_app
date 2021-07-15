import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/models/symbols.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Currencies with ChangeNotifier {
  List<Currency> _currencies = [];
  Map<String, String> _symbols = {};
  String apiKey = '4946fc8acfd60b0b2040cbbcd6288b36';
  Currency _fromCurrency;
  Currency _toCurrency;
  double _amount;

  List<Currency> get getCurrencies {
    return [..._currencies];
  }

  Map<String, String> get getSymbols {
    return _symbols;
  }

  double get getAmount {
    if (this._amount == null) return 0;
    return this._amount;
  }

  void setAmount(double amountToSet) {
    this._amount = amountToSet;
    notifyListeners();
  }

  void setFromCurrency(Currency currencyToSet) {
    this._fromCurrency = currencyToSet;
    notifyListeners();
  }

  Currency get getFromCurrency {
    if (this._fromCurrency == null) return Currency(base: 'EUR');
    return this._fromCurrency;
  }

  void setToCurrency(Currency currencyToSet) {
    this._toCurrency = currencyToSet;
    notifyListeners();
  }

  Currency get getToCurrency {
    if (this._toCurrency == null) return Currency(base: 'USD');
    return this._toCurrency;
  }

  Future<void> fetchAndSetCurrencies() async {
    final List<String> bases = Symbols.abbreviations;
    final symbolsURL = 'http://data.fixer.io/api/symbols?access_key=$apiKey';
    final List urls = [];
    try {
      List<Currency> listToReturn = [];
      for (int i = 0; i < bases.length; i++) {
        String base = bases[i];
        urls.add(Uri.parse(
            'http://data.fixer.io/api/latest?access_key=$apiKey&base=$base'));
      }
      // print(bases.length);
      // print(urls.length);
      List responses =
          await Future.wait([for (int i = 0; i < 70; i++) http.get(urls[i])]);
      // print(responses);
      List responses2ndHalf = await Future.wait(
        [
          for (int i = 70; i < bases.length; i++) http.get(urls[i]),
          http.get(Uri.parse(symbolsURL))
        ],
      );

      for (int i = 0; i < responses.length; i++) {
        listToReturn.add(currencyFromJson(responses[i].body));
      }
      for (int i = 0; i < responses2ndHalf.length - 1; i++) {
        listToReturn.add(currencyFromJson(responses2ndHalf[i].body));
      }

      final listOfSymbols = symbolsFromJson(responses2ndHalf.last.body);

      print(listToReturn.length);
      _currencies = listToReturn;
      _symbols = listOfSymbols.symbols;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
