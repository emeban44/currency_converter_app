import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/models/symbols.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Currencies with ChangeNotifier {
  List<Currency> _currencies;
  String api_key = '4946fc8acfd60b0b2040cbbcd6288b36';

  List<Currency> get getCurrencies {
    return [..._currencies];
  }

  Future<void> fetchAndSetCurrencies() async {
    final List<String> bases = Symbols.symbols;
    final List urls = [];
    try {
      List<Currency> listToReturn = [];
      for (int i = 0; i < bases.length; i++) {
        String base = bases[i];
        urls.add(Uri.parse(
            'http://data.fixer.io/api/latest?access_key=$api_key&base=$base'));
      }
      print(bases.length);
      print(urls.length);
      List responses =
          await Future.wait([for (int i = 0; i < 70; i++) http.get(urls[i])]);
      // print(responses);
      List responses2ndHalf = await Future.wait(
          [for (int i = 70; i < bases.length; i++) http.get(urls[i])]);

      for (int i = 0; i < responses.length; i++) {
        listToReturn.add(currencyFromJson(responses[i].body));
      }
      for (int i = 0; i < responses2ndHalf.length; i++) {
        listToReturn.add(currencyFromJson(responses2ndHalf[i].body));
      }

      print(listToReturn.length);
      _currencies = listToReturn;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
