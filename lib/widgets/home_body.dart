import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/screens/edit_currencies_screen.dart';
import 'package:currency_converter_app/widgets/calculator/custom_calculator.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_stack.dart';
import 'package:currency_converter_app/widgets/currency_list_view.dart';
import 'package:flutter/material.dart';
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
  void didChangeDependencies() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Currencies>(context, listen: false)
        .fetchAndSetCurrencies();
    setState(() {
      _isLoading = false;
    });
    super.didChangeDependencies();
  }

  void _toggleCalculator(bool current, [TextEditingController controller]) {
    if (current && _displayCalculator) {
      //  _alreadyToggled = true;
      //  print(controller.text);
    } else if (current && !_displayCalculator)
      setState(() {
        _displayCalculator = current;
        _textEditingController = controller;
        //  _alreadyToggled = true;
      });
    else if (!current && _displayCalculator) {
      setState(() {
        _displayCalculator = current;
        _textEditingController = controller;
        //   _alreadyToggled = false;
      });
    }
    // print(_alreadyToggled);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: ConversionStack(_toggleCalculator), fit: FlexFit.loose),
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
                        // Navigator.of(context)
                        //     .pushNamed(EditCurrenciesScreen.routeName);
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
