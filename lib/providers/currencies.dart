import 'package:currency_converter_app/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Currencies with ChangeNotifier {
  List<Currency> _currencies;
  String api_key = '847f2ea73c364f9bc8e7788d850d06b2';

  Future<void> fetchAndSetCurrencies() async {
    final url = Uri.parse(
        'http://data.fixer.io/api/latest?access_key=847f2ea73c364f9bc8e7788d850d06b2');

    try {
      final response = await http.get(url);
      // print(response.body);
      final currency = currencyFromJson(response.body);
      print(currency.rates['BAM']);
      List<Currency> listToReturn;
      listToReturn.add(currency);
      _currencies = listToReturn;
      notifyListeners();
    } catch (error) {
      print(error.message);
    }
  }
}
