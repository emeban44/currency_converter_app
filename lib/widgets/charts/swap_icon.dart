import 'package:flutter/material.dart';

class SwapIcon extends StatelessWidget {
  final Function() toggle;
  SwapIcon(this.toggle);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: GestureDetector(
        onTap: () => toggle(),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.swap_horiz, size: 40, color: Colors.white),
        ),
      ),
    );
  }
}
