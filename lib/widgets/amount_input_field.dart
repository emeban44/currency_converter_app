import 'package:flutter/material.dart';

class AmountInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1),
          boxShadow: [
            BoxShadow(
                color: Colors.black, blurRadius: 1.0, offset: Offset(2.0, 2.0)),
          ],
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
          ),
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          readOnly: true,
          showCursor: true,
          onTap: () {},
          initialValue: '0.00',
          style: TextStyle(fontSize: 23),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
