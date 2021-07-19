import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      right: 5,
      child: Container(
        height: 20,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: Colors.indigo)),
        child: Container(
          child: Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 3), child: Text('Edit')),
              Icon(Icons.list),
            ],
          ),
        ),
      ),
    );
  }
}
