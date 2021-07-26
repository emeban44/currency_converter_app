import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;
  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  void setAppUsedBefore(bool value) {
    _sharedPrefs.setBool('used', value);
  }

  void setSymbols(Map<String, String> symbols) {
    var s = jsonEncode(symbols);
    _sharedPrefs.setString('symbols', s);
  }

  String get getSymbols {
    return _sharedPrefs.getString('symbols');
  }

  bool get getAppUsedBefore {
    if (_sharedPrefs.getBool('used') == null) return false;
    return _sharedPrefs.getBool('used');
  }
}
