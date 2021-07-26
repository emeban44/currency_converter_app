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

  bool get getAppUsedBefore {
    if (_sharedPrefs.getBool('used') == null) return null;
    return _sharedPrefs.getBool('used');
  }
}
