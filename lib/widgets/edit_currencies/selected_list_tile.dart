import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedListTile extends StatelessWidget {
  final int i;
  final Function() onPress;
  final String base;
  final String path;
  final String symbol;
  const SelectedListTile(
      {this.i, this.onPress, this.base, this.path, this.symbol});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        key: ValueKey(base),
        leading: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.indigo),
              borderRadius: BorderRadius.circular(21)),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/$path.png'),
          ),
        ),
        title: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Text(
                  base,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(left: 7.5),
                  child: Text(
                    symbol,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            //   widget.rebuildState(selected[i]);
            final selectionCount =
                Provider.of<Currencies>(context, listen: false)
                    .getSelected
                    .length;
            if (selectionCount <= 2) {
              showToast(
                'There must be at least 2 currencies selected!',
                borderRadius: BorderRadius.circular(15),
                textStyle: TextStyle(fontSize: 20, color: Colors.white),
                context: context,
                animation: StyledToastAnimation.slideFromRight,
                reverseAnimation: StyledToastAnimation.fade,
                position: StyledToastPosition.center,
                animDuration: Duration(seconds: 1),
                duration: Duration(seconds: 3),
                curve: Curves.elasticOut,
                reverseCurve: Curves.linear,
              );
              return;
            }
            onPress();
          },
          icon: Icon(
            Icons.remove_circle,
            color: Colors.red,
            size: 27,
          ),
        ),
      ),
    );
  }
}
