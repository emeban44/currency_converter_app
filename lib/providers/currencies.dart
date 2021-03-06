import 'dart:convert';

import 'package:currency_converter_app/database/boxes.dart';
import 'package:currency_converter_app/helpers/shared_preferences.dart';
import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/models/local_currency.dart';
import 'package:currency_converter_app/models/symbols.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Currencies with ChangeNotifier {
  //in this list all the UNSELECTED currencies are stored!
  List<Currency> _currencies = [];
  // in this list are all selected currencies including FROM and TO currency
  List<Currency> _selectedCurrencies = [];
  // in this list are all selected currencies excluding FROM and TO currency
  List<Currency> _selectedHomeScreen = [];
  List<Currency> _unselectedCurrencies = [];
  // this list gets filled everytime user searches something
  List<Currency> _searchedSelectedCurrencies = [];
  // this list gets filled everytime user searches something
  List<Currency> _searchedUnselectedCurrencies = [];
  Map<String, String> _symbols = {};
  String _apiKey = '4946fc8acfd60b0b2040cbbcd6288b36';
  Currency _fromCurrency;
  Currency _toCurrency;
  double _amount;
  String _helperNumber = '';
  List<String> _helpersHistory = [];
  List<double> _numbers = [];
  List<String> _operations = [];

  List<Currency> get getCurrencies {
    return [..._currencies];
  }

  List<Currency> get getSelected {
    return [..._selectedCurrencies];
  }

  List<Currency> get getHomeSelected {
    return [..._selectedHomeScreen];
  }

  List<Currency> get getUnselected {
    return [..._unselectedCurrencies];
  }

  List<Currency> get getSearchedSelected {
    return [..._searchedSelectedCurrencies];
  }

  List<Currency> get getSearchedUnselected {
    return [..._searchedUnselectedCurrencies];
  }

  Map<String, String> get getSymbols {
    return _symbols;
  }

  double get getAmount {
    if (this._amount == null) {
      return 1;
    }
    return this._amount;
  }

  List<double> get getNumbers {
    return [..._numbers];
  }

  String get getHelper {
    return this._helperNumber;
  }

  List<String> get getHelperHistory {
    return [...this._helpersHistory];
  }

  List<String> get getOperations {
    return [...this._operations];
  }

  void addOperation(String operation) {
    this._operations.add(operation);
    notifyListeners();
  }

  void removeLastOperation() {
    if (_operations.isEmpty) return;
    this._operations.removeLast();
    notifyListeners();
  }

  void addHelper(String newHelper) {
    this._helpersHistory.add(newHelper);
    notifyListeners();
  }

  void expandHelper(String number) {
    this._helperNumber += number;
    notifyListeners();
  }

  void removeLastHelper() {
    this._helpersHistory.removeLast();
    notifyListeners();
  }

  void rewindHelper(String text) {
    this._helperNumber = _helpersHistory.last;
    notifyListeners();
  }

  void reduceHelper() {
    this._helperNumber = _helperNumber.substring(0, _helperNumber.length - 1);
    notifyListeners();
  }

  void restartHelper() {
    this._helperNumber = '';
    notifyListeners();
  }

  void addCalculatorNumber(double number) {
    this._numbers.add(number);
    notifyListeners();
  }

  void updateNumbers(double number) {
    if (_numbers.isEmpty) {
      _numbers.add(number);
      notifyListeners();
      return;
    }
    _numbers.last = number;
    notifyListeners();
  }

  void removeLastNumber() {
    _numbers.removeLast();
    notifyListeners();
  }

  void search(String searchText) {
    List<Currency> selectedContainedInSearch = [];
    List<Currency> unselectedContainedInSearch = [];
    List<Currency> selectedListToReturn = [];
    List<Currency> unselectedListToReturn = [];

    selectedContainedInSearch = this
        ._selectedCurrencies
        .where((c) =>
            (c.base.contains(searchText.toUpperCase()) ||
                this._symbols[c.base].contains(searchText) ||
                this._symbols[c.base].toLowerCase().contains(searchText)) ||
            this
                ._symbols[c.base]
                .toLowerCase()
                .contains(searchText.toLowerCase()))
        .toList();

    selectedContainedInSearch.forEach((c) {
      selectedListToReturn.add(c);
    });

    unselectedContainedInSearch = this
        ._currencies
        .where((c) =>
            (c.base.contains(searchText.toUpperCase()) ||
                this._symbols[c.base].contains(searchText) ||
                this._symbols[c.base].toLowerCase().contains(searchText)) ||
            this
                ._symbols[c.base]
                .toLowerCase()
                .contains(searchText.toLowerCase()))
        .toList();

    unselectedContainedInSearch.forEach((c) {
      unselectedListToReturn.add(c);
    });
    // if (selectedListToReturn.isEmpty == false)
    this._searchedSelectedCurrencies = selectedListToReturn;
    // if (unselectedListToReturn.isEmpty == false)
    this._searchedUnselectedCurrencies = unselectedListToReturn;
    notifyListeners();
  }

  void selectCurrency(Currency toSelect) {
    _selectedCurrencies.insert(0, toSelect);
    _currencies.remove(toSelect);
    _selectedHomeScreen.add(toSelect);
    final selectedBox = Boxes.getSelected();
    final unselectedBox = Boxes.getCurrencies();
    selectedBox.put(toSelect.base, toLocal(toSelect));
    unselectedBox.delete(toSelect.base);
    notifyListeners();
  }

  void selectSearchedCurrency(Currency toSelectFromSearched) {
    _searchedSelectedCurrencies.insert(0, toSelectFromSearched);
    _searchedUnselectedCurrencies.remove(toSelectFromSearched);
    _selectedCurrencies.insert(0, toSelectFromSearched);
    _selectedHomeScreen.add(toSelectFromSearched);
    _currencies.remove(toSelectFromSearched);
    final selectedBox = Boxes.getSelected();
    final unselectedBox = Boxes.getCurrencies();
    selectedBox.put(toSelectFromSearched.base, toLocal(toSelectFromSearched));
    unselectedBox.delete(toSelectFromSearched.base);
    notifyListeners();
  }

  void unselectSearchedCurrency(Currency toUnselectFromSearched) {
    final selectedBox = Boxes.getSelected();
    final unselectedBox = Boxes.getCurrencies();
    if (toUnselectFromSearched.base == _toCurrency.base) {
      _searchedUnselectedCurrencies.insert(0, toUnselectFromSearched);
      _searchedSelectedCurrencies.remove(toUnselectFromSearched);
      _currencies.insert(0, toUnselectFromSearched);
      selectedBox.delete('to');
      final elementToReplace = _selectedHomeScreen.last;
      _selectedHomeScreen.removeLast();
      selectedBox.put('to', toLocal(elementToReplace));
      selectedBox.delete(elementToReplace.base);
      unselectedBox.put(
          toUnselectFromSearched.base, toLocal(toUnselectFromSearched));
      this._toCurrency = elementToReplace;
      notifyListeners();
      return;
    } else if (toUnselectFromSearched.base == _fromCurrency.base) {
      _searchedUnselectedCurrencies.insert(0, toUnselectFromSearched);
      _searchedSelectedCurrencies.remove(toUnselectFromSearched);
      _currencies.insert(0, toUnselectFromSearched);
      selectedBox.delete('from');
      final elementToReplace = _selectedHomeScreen.last;
      _selectedHomeScreen.removeLast();
      selectedBox.put('from', toLocal(elementToReplace));
      selectedBox.delete(elementToReplace.base);
      unselectedBox.put(
          toUnselectFromSearched.base, toLocal(toUnselectFromSearched));
      this._fromCurrency = elementToReplace;
      notifyListeners();
      return;
    }
    _searchedUnselectedCurrencies.insert(0, toUnselectFromSearched);
    _searchedSelectedCurrencies.remove(toUnselectFromSearched);
    _currencies.insert(0, toUnselectFromSearched);
    _selectedCurrencies
        .removeWhere((c) => c.base == toUnselectFromSearched.base);
    _selectedHomeScreen
        .removeWhere((c) => c.base == toUnselectFromSearched.base);
    selectedBox.delete(toUnselectFromSearched.base);
    unselectedBox.put(
        toUnselectFromSearched.base, toLocal(toUnselectFromSearched));
    notifyListeners();
  }

  void unselectCurrency(Currency toUnselect) {
    final selectedBox = Boxes.getSelected();
    final unselectedBox = Boxes.getCurrencies();
    if (toUnselect.base == _toCurrency.base) {
      _currencies.insert(0, toUnselect);
      _selectedCurrencies.remove(toUnselect);
      selectedBox.delete('to');
      final elementToReplace = _selectedHomeScreen.last;
      _selectedHomeScreen.removeLast();
      selectedBox.put('to', toLocal(elementToReplace));
      selectedBox.delete(elementToReplace.base);
      unselectedBox.put(toUnselect.base, toLocal(toUnselect));
      this._toCurrency = elementToReplace;
      notifyListeners();
      return;
    } else if (toUnselect.base == _fromCurrency.base) {
      _currencies.insert(0, toUnselect);
      _selectedCurrencies.remove(toUnselect);
      selectedBox.delete('from');
      final elementToReplace = _selectedHomeScreen.last;
      _selectedHomeScreen.removeLast();
      selectedBox.put('from', toLocal(elementToReplace));
      selectedBox.delete(elementToReplace.base);
      unselectedBox.put(toUnselect.base, toLocal(toUnselect));
      this._fromCurrency = elementToReplace;
      notifyListeners();
      return;
    }
    _currencies.insert(0, toUnselect);
    _selectedCurrencies.remove(toUnselect);
    _selectedHomeScreen.removeWhere((c) => c.base == toUnselect.base);
    selectedBox.delete(toUnselect.base);
    unselectedBox.put(toUnselect.base, toLocal(toUnselect));
    notifyListeners();
  }

  void restartAmount() {
    this._amount = 1;
    this._helperNumber = '';
    this._helpersHistory = [];
    this._numbers = [];
    this._operations = [];
    notifyListeners();
  }

  void setAmount() {
    if (_numbers.isEmpty) {
      this._amount = 1;
      notifyListeners();
      return;
    }
    if (_numbers.length == 1) {
      this._amount = _numbers.first;
      notifyListeners();
      return;
    }
    double tmpAmount = getNumbers.first;

    for (int i = 0; i < _numbers.length - 1; i++) {
      if (_operations[i] == 'x') tmpAmount = tmpAmount * _numbers[i + 1];
      if (_operations[i] == '/') tmpAmount = tmpAmount / _numbers[i + 1];
      if (_operations[i] == '-') tmpAmount = tmpAmount - _numbers[i + 1];
      if (_operations[i] == '+') tmpAmount = tmpAmount + _numbers[i + 1];
    }

    this._amount = tmpAmount;
    notifyListeners();
  }

  void setFromCurrency(Currency currencyToSet) {
    final index =
        _selectedHomeScreen.indexWhere((c) => c.base == currencyToSet.base);
    _selectedHomeScreen.insert(index, this._fromCurrency);
    _selectedHomeScreen.removeWhere((c) => c.base == currencyToSet.base);
    this._fromCurrency = currencyToSet;
    final selectedBox = Boxes.getSelected();
    final previousFrom = selectedBox.get('from');
    selectedBox.put('from', toLocal(currencyToSet));
    selectedBox.delete(previousFrom.base);
    selectedBox.put(previousFrom.base, previousFrom);
    selectedBox.delete(currencyToSet.base);
    notifyListeners();
  }

  Currency get getFromCurrency {
    if (this._fromCurrency == null)
      this._fromCurrency = Currency(base: 'EUR', rates: defaultEuroRates);
    return this._fromCurrency;
  }

  void setToCurrency(Currency currencyToSet) {
    final index =
        _selectedHomeScreen.indexWhere((c) => c.base == currencyToSet.base);
    _selectedHomeScreen.insert(index, this._toCurrency);
    _selectedHomeScreen.removeWhere((c) => c.base == currencyToSet.base);
    this._toCurrency = currencyToSet;
    final selectedBox = Boxes.getSelected();
    final previousTo = selectedBox.get('to');
    selectedBox.put('to', toLocal(currencyToSet));
    selectedBox.delete(previousTo.base);
    selectedBox.put(previousTo.base, previousTo);
    selectedBox.delete(currencyToSet.base);
    notifyListeners();
  }

  Currency get getToCurrency {
    if (this._toCurrency == null)
      this._toCurrency = Currency(base: 'USD', rates: defaultUSDrates);
    return this._toCurrency;
  }

  void toggleFromTo() {
    Currency fromStored = this._fromCurrency;
    Currency toStored = this._toCurrency;
    final selectedBox = Boxes.getSelected();
    selectedBox.delete('from');
    selectedBox.delete('to');
    selectedBox.put('to', toLocal(fromStored));
    selectedBox.put('from', toLocal(toStored));
    this._toCurrency = fromStored;
    this._fromCurrency = toStored;
    notifyListeners();
  }

  Future<void> fetchAndSetCurrencies() async {
    final List<String> bases = Symbols.abbreviations;
    final symbolsURL = 'http://data.fixer.io/api/symbols?access_key=$_apiKey';
    final List urls = [];
    try {
      List<Currency> listToReturn = [];
      for (int i = 0; i < bases.length; i++) {
        String base = bases[i];
        urls.add(Uri.parse(
            'http://data.fixer.io/api/latest?access_key=$_apiKey&base=$base'));
      }
      List responses =
          await Future.wait([for (int i = 0; i < 70; i++) http.get(urls[i])]);

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

      _currencies = listToReturn;
      final boxAll = Boxes.getCurrencies();
      _currencies.forEach((c) {
        final lc = LocalCurrency()
          ..base = c.base
          ..date = c.date
          ..rates = c.rates
          ..success = c.success
          ..timestamp = c.timestamp;

        boxAll.put(lc.base, lc);
      });
      final selectedBox = Boxes.getSelected();
      Currency from = _currencies.firstWhere((e) => e.base == 'USD');
      Currency to = _currencies.firstWhere((e) => e.base == 'EUR');
      Currency gbp = _currencies.firstWhere((e) => e.base == 'GBP');
      Currency pln = _currencies.firstWhere((e) => e.base == 'PLN');
      selectedBox.put('from', toLocal(from));
      selectedBox.put('to', toLocal(to));
      selectedBox.put('GBP', toLocal(gbp));
      selectedBox.put('PLN', toLocal(pln));
      // selectedBox.put('USD', toLocal(from2));
      // selectedBox.put('EUR', toLocal(to2));

      _toCurrency = (fromLocal(selectedBox.get('to')));
      _fromCurrency = (fromLocal(selectedBox.get('from')));

      // boxAll.delete('USD');
      // boxAll.delete('EUR');
      _currencies.removeWhere((e) => e.base == 'USD');
      _currencies.removeWhere((e) => e.base == 'EUR');
      _currencies.removeWhere((e) => e.base == 'GBP');
      _currencies.removeWhere((e) => e.base == 'PLN');

      List<LocalCurrency> unselectedStored = boxAll.values.toList();
      unselectedStored.forEach((unselectedLocal) {
        _unselectedCurrencies.add(fromLocal(unselectedLocal));
      });

      List<LocalCurrency> selectedStored = selectedBox.values.toList();
      selectedStored.forEach((selectedLocal) {
        _selectedCurrencies.add(fromLocal(selectedLocal));
        if (selectedLocal.key == 'from' || selectedLocal.key == 'to') return;
        _selectedHomeScreen.add(fromLocal(selectedLocal));
      });

      _symbols = listOfSymbols.symbols;
      SharedPrefs().setSymbols(_symbols);

      SharedPrefs().setAppUsedBefore(true);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> updateLocalData() async {
    final List<String> bases = Symbols.abbreviations;
    final symbolsURL = 'http://data.fixer.io/api/symbols?access_key=$_apiKey';
    final List urls = [];
    try {
      List<Currency> listToReturn = [];
      for (int i = 0; i < bases.length; i++) {
        String base = bases[i];
        urls.add(Uri.parse(
            'http://data.fixer.io/api/latest?access_key=$_apiKey&base=$base'));
      }
      List responses =
          await Future.wait([for (int i = 0; i < 70; i++) http.get(urls[i])]);

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

      //_currencies = listToReturn;

      final selectedBox = Boxes.getSelected();
      final unselectedBox = Boxes.getCurrencies();

      listToReturn.forEach((c) {
        final lc = LocalCurrency()
          ..base = c.base
          ..date = c.date
          ..rates = c.rates
          ..success = c.success
          ..timestamp = c.timestamp;

        //boxAll.put(lc.base, lc);

        if (selectedBox.containsKey(lc.base)) {
          selectedBox.put(lc.base, lc);
          _selectedCurrencies.removeWhere((e) => e.base == lc.base);
          _selectedCurrencies.add(fromLocal(lc));
          _selectedHomeScreen.removeWhere((e) => e.base == lc.base);
          _selectedHomeScreen.add(fromLocal(lc));
          //print(lc.base + ' 1');
        } else if (unselectedBox.containsKey(lc.base)) {
          unselectedBox.put(lc.base, lc);
          _currencies.removeWhere((e) => e.base == lc.base);
          _currencies.add(fromLocal(lc));
          //print(lc.base + ' 2');
        } else if (selectedBox.get('from').base == lc.base) {
          selectedBox.put('from', lc);
          _fromCurrency = fromLocal(selectedBox.get('from'));
          //print(_fromCurrency.rates['EUR']);
          _selectedCurrencies.removeWhere((e) => e.base == lc.base);
          _selectedCurrencies.add(fromLocal(lc));
          //print(lc.base + ' 3');
        } else if (selectedBox.get('to').base == lc.base) {
          selectedBox.put('to', lc);
          _toCurrency = fromLocal(selectedBox.get('to'));
          //print(_toCurrency.rates['BTC']);
          _selectedCurrencies.removeWhere((e) => e.base == lc.base);
          _selectedCurrencies.add(fromLocal(lc));
          //print(lc.base + ' 4');
        }
      });
      _symbols = listOfSymbols.symbols;
      SharedPrefs().setSymbols(_symbols);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  void loadLocalApplicationState() async {
    // Future.delayed(Duration(milliseconds: 1));
    final selectedBox = Boxes.getSelected();
    final unselectedBox = Boxes.getCurrencies();

    List<LocalCurrency> selected = selectedBox.values.toList();
    selected.forEach((lc) {
      _selectedCurrencies.add(fromLocal(lc));
      if (lc.key == 'to' || lc.key == 'from') return;
      _selectedHomeScreen.add(fromLocal(lc));
    });

    List<LocalCurrency> unselected = unselectedBox.values.toList();
    unselected.forEach((lc) {
      _currencies.add(fromLocal(lc));
    });

    _toCurrency = fromLocal(selectedBox.get('to'));
    _fromCurrency = fromLocal(selectedBox.get('from'));

    var s = SharedPrefs().getSymbols;
    Map<String, String> simboli = jsonDecode(s).cast<String, String>();
    _symbols = simboli;
  }

  static Map<String, double> defaultEuroRates = {
    "AED": 4.340695,
    "AFN": 93.654386,
    "ALL": 122.252517,
    "AMD": 585.487964,
    "ANG": 2.121046,
    "AOA": 759.867707,
    "ARS": 113.668263,
    "AUD": 1.587664,
    "AWG": 2.127747,
    "AZN": 2.013379,
    "BAM": 1.955604,
    "BBD": 2.385845,
    "BDT": 100.209324,
    "BGN": 1.955669,
    "BHD": 0.445549,
    "BIF": 2345.780763,
    "BMD": 1.181754,
    "BND": 1.599499,
    "BOB": 8.159227,
    "BRL": 6.025167,
    "BSD": 1.181674,
    "BTC": 3.7122999e-5,
    "BTN": 88.011826,
    "BWP": 13.028336,
    "BYN": 3.00243,
    "BYR": 23162.369247,
    "BZD": 2.381906,
    "CAD": 1.483343,
    "CDF": 2364.688846,
    "CHF": 1.084028,
    "CLF": 0.032288,
    "CLP": 890.90081,
    "CNY": 7.635668,
    "COP": 4508.590626,
    "CRC": 732.22615,
    "CUC": 1.181754,
    "CUP": 31.316469,
    "CVE": 110.64162,
    "CZK": 25.577043,
    "DJF": 210.357488,
    "DKK": 7.437601,
    "DOP": 67.454438,
    "DZD": 158.739326,
    "EGP": 18.535879,
    "ERN": 17.731325,
    "ETB": 51.997395,
    "EUR": 1,
    "FJD": 2.447437,
    "FKP": 0.854125,
    "GBP": 0.853167,
    "GEL": 3.704772,
    "GGP": 0.854125,
    "GHS": 7.008,
    "GIP": 0.854125,
    "GMD": 60.49398,
    "GNF": 11640.271847,
    "GTQ": 9.157775,
    "GYD": 247.213544,
    "HKD": 9.179968,
    "HNL": 28.302813,
    "HRK": 7.492548,
    "HTG": 111.426661,
    "HUF": 359.406412,
    "IDR": 17155.634214,
    "ILS": 3.862242,
    "IMP": 0.854125,
    "INR": 88.039516,
    "IQD": 1725.951035,
    "IRR": 49757.732629,
    "ISK": 146.112576,
    "JEP": 0.854125,
    "JMD": 181.973066,
    "JOD": 0.83784,
    "JPY": 129.883576,
    "KES": 127.8538,
    "KGS": 100.168149,
    "KHR": 4822.73606,
    "KMF": 492.079423,
    "KPW": 1063.578187,
    "KRW": 1348.90666,
    "KWD": 0.355223,
    "KYD": 0.984703,
    "KZT": 503.494639,
    "LAK": 11244.384631,
    "LBP": 1809.828351,
    "LKR": 235.111318,
    "LRD": 202.729813,
    "LSL": 17.087846,
    "LTL": 3.489411,
    "LVL": 0.714831,
    "LYD": 5.335607,
    "MAD": 10.564282,
    "MDL": 21.269784,
    "MGA": 4490.66375,
    "MKD": 61.651703,
    "MMK": 1944.689135,
    "MNT": 3365.769454,
    "MOP": 9.454468,
    "MRO": 421.885808,
    "MUR": 50.815291,
    "MVR": 18.201225,
    "MWK": 957.220115,
    "MXN": 23.579664,
    "MYR": 4.963953,
    "MZN": 75.135697,
    "NAD": 17.087972,
    "NGN": 485.701105,
    "NIO": 41.656612,
    "NOK": 10.395124,
    "NPR": 140.797678,
    "NZD": 1.689378,
    "OMR": 0.454997,
    "PAB": 1.181649,
    "PEN": 4.681516,
    "PGK": 4.130225,
    "PHP": 59.240714,
    "PKR": 188.430772,
    "PLN": 4.579645,
    "PYG": 8068.936491,
    "QAR": 4.30277,
    "RON": 4.930327,
    "RSD": 117.513944,
    "RUB": 87.646527,
    "RWF": 1178.799149,
    "SAR": 4.43242,
    "SBD": 9.492051,
    "SCR": 17.058886,
    "SDG": 527.062367,
    "SEK": 10.231681,
    "SGD": 1.600396,
    "SHP": 0.854125,
    "SLL": 12112.974022,
    "SOS": 691.325812,
    "SRD": 25.122843,
    "STD": 24343.914829,
    "SVC": 10.340156,
    "SYP": 1485.89641,
    "SZL": 17.088367,
    "THB": 38.631627,
    "TJS": 13.476159,
    "TMT": 4.136137,
    "TND": 3.296502,
    "TOP": 2.662018,
    "TRY": 10.119373,
    "TTD": 8.023741,
    "TWD": 33.014059,
    "TZS": 2740.253635,
    "UAH": 32.240095,
    "UGX": 4197.150836,
    "USD": 1.181754,
    "UYU": 51.962439,
    "UZS": 12567.949156,
    "VEF": 252694620707.6007,
    "VND": 27190.320274,
    "VUV": 130.133164,
    "WST": 3.015428,
    "XAF": 655.792481,
    "XAG": 0.044893,
    "XAU": 0.000647,
    "XCD": 3.193748,
    "XDR": 0.830392,
    "XOF": 656.460649,
    "XPF": 119.74119,
    "YER": 295.793476,
    "ZAR": 17.199058,
    "ZMK": 10637.200801,
    "ZMW": 26.784407,
    "ZWL": 380.52492
  };

  Map<String, double> defaultUSDrates = {
    "AED": 3.673197,
    "AFN": 79.249983,
    "ALL": 103.45026,
    "AMD": 495.43968,
    "ANG": 1.794829,
    "AOA": 642.999672,
    "ARS": 96.187204,
    "AUD": 1.344167,
    "AWG": 1.8005,
    "AZN": 1.701299,
    "BAM": 1.654833,
    "BBD": 2.018902,
    "BDT": 84.797144,
    "BGN": 1.654083,
    "BHD": 0.376962,
    "BIF": 1985,
    "BMD": 1,
    "BND": 1.353496,
    "BOB": 6.904339,
    "BRL": 5.0912,
    "BSD": 0.999932,
    "BTC": 3.145223e-5,
    "BTN": 74.475619,
    "BWP": 11.02458,
    "BYN": 2.540656,
    "BYR": 19600,
    "BZD": 2.015569,
    "CAD": 1.253655,
    "CDF": 2000.999834,
    "CHF": 0.917405,
    "CLF": 0.027229,
    "CLP": 751.330138,
    "CNY": 6.460301,
    "COP": 3806.99,
    "CRC": 619.609867,
    "CUC": 1,
    "CUP": 26.5,
    "CVE": 93.597505,
    "CZK": 21.637949,
    "DJF": 178.004535,
    "DKK": 6.292439,
    "DOP": 57.065012,
    "DZD": 134.327196,
    "EGP": 15.668299,
    "ERN": 15.00425,
    "ETB": 43.999938,
    "EUR": 0.846065,
    "FJD": 2.070965,
    "FKP": 0.722761,
    "GBP": 0.721785,
    "GEL": 3.135014,
    "GGP": 0.722761,
    "GHS": 5.929656,
    "GIP": 0.722761,
    "GMD": 51.149963,
    "GNF": 9840.000042,
    "GTQ": 7.74931,
    "GYD": 209.192135,
    "HKD": 7.76805,
    "HNL": 23.949744,
    "HRK": 6.338797,
    "HTG": 94.289256,
    "HUF": 303.620294,
    "IDR": 14514.05,
    "ILS": 3.275701,
    "IMP": 0.722761,
    "INR": 74.512203,
    "IQD": 1460.5,
    "IRR": 42104.999953,
    "ISK": 123.630225,
    "JEP": 0.722761,
    "JMD": 153.985633,
    "JOD": 0.709001,
    "JPY": 109.96802,
    "KES": 108.200677,
    "KGS": 84.762304,
    "KHR": 4080.000143,
    "KMF": 416.39876,
    "KPW": 900.000006,
    "KRW": 1141.090143,
    "KWD": 0.300601,
    "KYD": 0.833256,
    "KZT": 426.057232,
    "LAK": 9514.999665,
    "LBP": 1531.502813,
    "LKR": 198.951229,
    "LRD": 171.549805,
    "LSL": 14.459404,
    "LTL": 2.95274,
    "LVL": 0.60489,
    "LYD": 4.515013,
    "MAD": 8.939499,
    "MDL": 17.998494,
    "MGA": 3799.999818,
    "MKD": 52.16968,
    "MMK": 1645.59621,
    "MNT": 2848.114569,
    "MOP": 8.000372,
    "MRO": 356.999828,
    "MUR": 43.001925,
    "MVR": 15.403518,
    "MWK": 810.000169,
    "MXN": 19.94929,
    "MYR": 4.200495,
    "MZN": 63.580153,
    "NAD": 14.46002,
    "NGN": 410.999695,
    "NIO": 35.250108,
    "NOK": 8.80114,
    "NPR": 119.143014,
    "NZD": 1.430865,
    "OMR": 0.385028,
    "PAB": 0.999911,
    "PEN": 3.9615,
    "PGK": 3.494978,
    "PHP": 50.135027,
    "PKR": 159.44994,
    "PLN": 3.87369,
    "PYG": 6827.935154,
    "QAR": 3.641025,
    "RON": 4.170099,
    "RSD": 99.440315,
    "RUB": 74.164005,
    "RWF": 997.5,
    "SAR": 3.750666,
    "SBD": 8.032175,
    "SCR": 14.533144,
    "SDG": 445.999893,
    "SEK": 8.66245,
    "SGD": 1.35389,
    "SHP": 0.722761,
    "SLL": 10249.999852,
    "SOS": 585.000191,
    "SRD": 21.215498,
    "STD": 20599.824032,
    "SVC": 8.749841,
    "SYP": 1257.365744,
    "SZL": 14.460073,
    "THB": 32.679,
    "TJS": 11.403527,
    "TMT": 3.5,
    "TND": 2.789497,
    "TOP": 2.252595,
    "TRY": 8.56532,
    "TTD": 6.789691,
    "TWD": 27.906502,
    "TZS": 2318.803015,
    "UAH": 27.281573,
    "UGX": 3551.629607,
    "USD": 1,
    "UYU": 43.970623,
    "UZS": 10634.999841,
    "VEF": 213830222338.07285,
    "VND": 23008.452706,
    "VUV": 110.118701,
    "WST": 2.551656,
    "XAF": 554.931686,
    "XAG": 0.038103,
    "XAU": 0.000549,
    "XCD": 2.70255,
    "XDR": 0.702678,
    "XOF": 555.497519,
    "XPF": 101.325037,
    "YER": 250.302109,
    "ZAR": 14.526796,
    "ZMK": 9001.186694,
    "ZMW": 22.664969,
    "ZWL": 322.000239
  };
}
