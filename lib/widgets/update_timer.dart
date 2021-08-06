import 'dart:async';

import 'package:flutter/material.dart';

class UpdateTimer extends StatefulWidget {
  @override
  _UpdateTimerState createState() => _UpdateTimerState();
}

class _UpdateTimerState extends State<UpdateTimer> {
  Duration minutes = Duration(minutes: 10);
  Duration maxMinutes = Duration(minutes: 10);
  Timer timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutes == Duration(minutes: 0)) {
        minutes = Duration(minutes: 10);
        print('UPDATE SHOULD HAPPEN NOW!!!!');
      }
      setState(() {
        minutes = minutes - Duration(seconds: 1);
      });
    });
  }

  @override
  void didChangeDependencies() {
    startTimer();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
