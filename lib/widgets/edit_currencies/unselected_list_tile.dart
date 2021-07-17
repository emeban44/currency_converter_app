import 'package:flutter/material.dart';

class UnselectedListTile extends StatelessWidget {
  final int i;
  final Function() onPress;
  final String base;
  final String path;
  final String symbol;
  const UnselectedListTile(
      {this.i, this.onPress, this.base, this.path, this.symbol});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.indigo,
      onTap: () {
        onPress();
      },
      child: Container(
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
                    child: Text(symbol, style: TextStyle(fontSize: 14)),
                  ),
                )
              ],
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              onPress();
            },
            icon:
                Icon(Icons.add_circle_outlined, color: Colors.green, size: 27),
          ),
        ),
      ),
    );
  }
}
