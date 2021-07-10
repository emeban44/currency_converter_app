import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        width: double.infinity,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo.shade300,
              Colors.indigo.shade300,
              Colors.indigo.shade300,
              Colors.indigo.shade300,
              Colors.blueGrey.shade600,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Text('DONE', style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
