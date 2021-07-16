import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/screens/edit_currencies_screen.dart';
import 'package:currency_converter_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
            // SliverAnimatedListTest.routeName: (ctx) => SliverAnimatedListTest(),
          },
        ),
      ),
    );
  }
}
