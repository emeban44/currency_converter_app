import 'package:currency_converter_app/widgets/conversion/conversion_stack.dart';
import 'package:currency_converter_app/widgets/drawer.dart';
import 'package:currency_converter_app/widgets/home_body.dart';
import 'package:flutter/material.dart';

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
        actions: [
          TextButton.icon(
            label: Text('Edit',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            icon: Icon(Icons.monetization_on, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.indigo,
      // ),
    );
  }
}
