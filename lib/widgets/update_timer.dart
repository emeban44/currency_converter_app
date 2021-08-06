import 'dart:async';

import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateTimer extends StatefulWidget {
  @override
  _UpdateTimerState createState() => _UpdateTimerState();
}

class _UpdateTimerState extends State<UpdateTimer> {
  Duration minutes = Duration(minutes: 1);
  Duration maxMinutes = Duration(minutes: 10);
  Timer timer;

  void startTimer() async {
    timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      if (minutes == Duration(minutes: 0)) {
        minutes = minutes = Duration(minutes: 10);
        print('UPDATE SHOULD HAPPEN NOW!!!!');
        print(ModalRoute.of(context).settings.name);
        showUpdateDialog();
        await Provider.of<Currencies>(context, listen: false).updateLocalData();
        //Navigator.of(context).popUntil(ModalRoute.withName('/'));
        Navigator.of(context).pop();
        //minutes = Duration(minutes: 10);
      }
      setState(() {
        minutes = minutes - Duration(seconds: 1);
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void showUpdateDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              height: 125,
              color: Colors.white,
              padding: const EdgeInsets.only(top: 35),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Updating currencies...',
                    style: TextStyle(color: Colors.black),
                  ),
                  Container(
                    child: LinearProgressIndicator(),
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'Update in ' + minutes.toString().substring(2, 7),
              style: TextStyle(fontSize: 13),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 3,
            width: 100,
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
              backgroundColor: Colors.transparent,
              value: double.parse(minutes.inSeconds.toString()) /
                  double.parse(maxMinutes.inSeconds.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
