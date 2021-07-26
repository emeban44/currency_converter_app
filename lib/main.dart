import 'package:currency_converter_app/helpers/shared_preferences.dart';
import 'package:currency_converter_app/models/local_currency.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/screens/edit_currencies_screen.dart';
import 'package:currency_converter_app/screens/home_screen.dart';
import 'package:currency_converter_app/screens/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final sharedPrefs = SharedPrefs();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await sharedPrefs.init();
  Hive.registerAdapter(LocalCurrencyAdapter());
  await Hive.openBox<LocalCurrency>('currencies');
  await Hive.openBox<LocalCurrency>('selectedCurrencies');
  await Hive.openBox<LocalCurrency>('unselectedCurrencies');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus.unfocus();
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Currencies(),
          ),
        ],
        child: MaterialApp(
          title: 'Currency Converter',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: HomeScreen(),
          routes: {
            EditCurrenciesScreen.routeName: (ctx) => EditCurrenciesScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            // SliverAnimatedListTest.routeName: (ctx) => SliverAnimatedListTest(),
          },
        ),
      ),
    );
  }
}
