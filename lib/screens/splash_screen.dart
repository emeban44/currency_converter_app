import 'package:currency_converter_app/helpers/shared_preferences.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    if (SharedPrefs().getAppUsedBefore) {
      Provider.of<Currencies>(context, listen: false)
          .loadLocalApplicationState();
    }
    Future.delayed(Duration(microseconds: 100)).then((value) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
