import 'package:currency_converter_app/screens/edit_currencies_screen.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  final double appBarHeight;
  EditButton(this.appBarHeight);
  @override
  Widget build(BuildContext context) {
    //final screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      top: appBarHeight + 3,
      right: 15,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print('4');
        },
        child: Container(
          //height: 50,
          //margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 7.5),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: Colors.white)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Icon(
                Icons.list,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
