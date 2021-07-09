import 'package:flutter/material.dart';

class StackBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.indigo,
            Colors.blueGrey.shade700,
          ],
        ),
      ),
    );
  }
}
