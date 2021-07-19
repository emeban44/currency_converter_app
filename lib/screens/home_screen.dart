import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/screens/edit_currencies_screen.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_stack.dart';
import 'package:currency_converter_app/widgets/drawer.dart';
import 'package:currency_converter_app/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      extendBodyBehindAppBar: true,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //title: Text('Update in...'),
        actions: [
          Container(
            // height: 20,
            margin: const EdgeInsets.only(right: 10),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(15),
            //     border: Border.all(width: 1, color: Colors.indigo)),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(EditCurrenciesScreen.routeName);
              },
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 3),
                      child: Text('Edit', style: TextStyle(fontSize: 16)),
                    ),
                    Icon(Icons.list),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
