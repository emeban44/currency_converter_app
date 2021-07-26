import 'package:currency_converter_app/helpers/shared_preferences.dart';
import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/screens/edit_currencies_screen.dart';
import 'package:currency_converter_app/widgets/calculator/custom_calculator.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_stack.dart';
import 'package:currency_converter_app/widgets/currency_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _displayCalculator = false;
  bool _isLoading = false;
  var _textEditingController = TextEditingController();
  // bool _alreadyToggled = false;

  @override
  void initState() {
    // setState(() {
    //   _isLoading = true;
    // });
    // if (SharedPrefs().getAppUsedBefore) {
    //   Provider.of<Currencies>(context, listen: false)
    //       .loadLocalApplicationState();
    // }
    // setState(() {
    //   _isLoading = false;
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    if (SharedPrefs().getAppUsedBefore != true) {
      setState(() {
        _isLoading = true;
      });
      print(SharedPrefs().getAppUsedBefore);
      await Provider.of<Currencies>(context, listen: false)
          .fetchAndSetCurrencies();
      setState(() {
        _isLoading = false;
      });
    } else {
      Provider.of<Currencies>(context, listen: false)
          .loadLocalApplicationState();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('disposed');
    Hive.close();
    super.dispose();
  }

  void _toggleCalculator(bool current, [TextEditingController controller]) {
    if (current && _displayCalculator) {
      //  _alreadyToggled = true;
      //  print(controller.text);
    } else if (current && !_displayCalculator)
      setState(() {
        _displayCalculator = current;
        _textEditingController = controller;
      });
    else if (!current && _displayCalculator) {
      setState(() {
        _displayCalculator = current;
        _textEditingController = controller;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: ConversionStack(_toggleCalculator, _displayCalculator),
            fit: FlexFit.loose),
        if (_displayCalculator)
          Flexible(
            child: CustomCalculator(_toggleCalculator, _textEditingController),
            fit: FlexFit.loose,
          ),
        if (_isLoading)
          Container(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        if (!_displayCalculator && !_isLoading)
          Flexible(
            fit: FlexFit.loose,
            child: Stack(
              children: [
                CurrencyListView(),
                Positioned(
                  bottom: 30,
                  right: 15,
                  child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(EditCurrenciesScreen.routeName);
                      },
                      child: Icon(Icons.add),
                      backgroundColor: Colors.indigo),
                )
              ],
            ),
          ),
      ],
    );
  }
}
