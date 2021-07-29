import 'package:flutter/material.dart';

class CurrencyContainer extends StatelessWidget {
  final String base;
  CurrencyContainer(this.base);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 125,
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(21)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 7.5),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(21)),
            child: CircleAvatar(
              radius: 17,
              backgroundImage:
                  AssetImage('assets/images/${base.toLowerCase()}.png'),
            ),
          ),
          Text(base, style: TextStyle(fontSize: 24, color: Colors.white)),
        ],
      ),
    );
  }
}
