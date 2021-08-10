import 'package:currency_converter_app/models/local_currency.dart';
import 'package:hive/hive.dart';

// These boxes are used to store data locally on the device

class Boxes {
  static Box<LocalCurrency> getCurrencies() =>
      Hive.box<LocalCurrency>('currencies');
  static Box<LocalCurrency> getSelected() =>
      Hive.box<LocalCurrency>('selectedCurrencies');
  static Box<LocalCurrency> getUnselected() =>
      Hive.box<LocalCurrency>('unselectedCurrencies');
}
