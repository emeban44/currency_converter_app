import 'package:flutter/material.dart';

class StackBackground extends StatelessWidget {
  Color color = Color(0xff4c5786);
  Color color2 = Color(0xff464f77);
  Color color3 = Color(0xff2c3145);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            //Colors.indigo.shade700,
            Color.fromRGBO(78, 90, 140, 1),
            //color2,
            Color.fromRGBO(54, 60, 84, 1)
            //Colors.blueGrey.shade700,
          ],
        ),
      ),
    );
  }
}
