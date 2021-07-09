import 'package:currency_converter_app/widgets/conversion_column.dart';
import 'package:flutter/material.dart';

class ConversionRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          ConversionColumn('From'),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(bottom: 20),
                width: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.swap_horiz_sharp,
                    size: 50,
                    color: Colors.indigo.shade100,
                  ),
                  onPressed: () {},
                )),
          ),
          ConversionColumn('To'),
        ],
      ),
    );
  }
}
