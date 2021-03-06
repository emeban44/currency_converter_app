import 'package:currency_converter_app/providers/currencies.dart';
import 'package:currency_converter_app/widgets/conversion/conversion_column.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversionRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          ConversionColumn('From'),
          Expanded(
            child: Container(
                padding: const EdgeInsets.only(bottom: 20, right: 2.5),
                width: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.swap_horiz_sharp,
                    size: screenWidth < 390 ? 45 : 50,
                    color: Colors.indigo.shade100,
                  ),
                  onPressed: () {
                    Provider.of<Currencies>(context, listen: false)
                        .toggleFromTo();
                  },
                )),
          ),
          ConversionColumn('To'),
        ],
      ),
    );
  }
}
