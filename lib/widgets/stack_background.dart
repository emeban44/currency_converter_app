import 'package:flutter/material.dart';

class StackBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 375,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.indigo.shade400,
            Colors.blueGrey.shade700,
          ],
        ),
      ),
    );
  }
}
