// import 'package:currency_converter_app/widgets/edit_currencies/currency_list_tile.dart';
// import 'package:flutter/cupertino.dart';   SVE JE RADILO PRIJE KOMENTIRANJA!!!!!!!!!!!!!!!
// import 'package:flutter/material.dart';

// class SliverAnimatedListTest extends StatefulWidget {
//   static final routeName = '/edit';
//   @override
//   _SliverAnimatedListTestState createState() => _SliverAnimatedListTestState();
// }

// class _SliverAnimatedListTestState extends State<SliverAnimatedListTest> {
//   int itemCount = 2;

//   // The key to be used when accessing SliverAnimatedListState
//   final GlobalKey<SliverAnimatedListState> _listKey =
//       GlobalKey<SliverAnimatedListState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Sliver Animated List Test")),

//       // fab will handle inserting a new item at the last index of the list.
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           _listKey.currentState.insertItem(itemCount);
//           itemCount++;
//         },
//       ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverAnimatedList(
//               key: _listKey,
//               initialItemCount: itemCount,

//               // Return a widget that is wrapped with a transition
//               itemBuilder: (context, index, animation) => SizeTransition(
//                     sizeFactor: animation,
//                     child: CustomListTile(
//                       i: index,

//                       // Handle removing an item using of(context) static method.
//                       // Returned widget should also utilize the [animation] param
//                       onPress: () {
//                         print(itemCount);
//                         print(index);
//                         _listKey.currentState.removeItem(
//                             index,
//                             (context, animation) => SizeTransition(
//                                 sizeFactor: animation,
//                                 key: ValueKey(itemCount),
//                                 child: CustomListTile(
//                                   i: index,
//                                 )));

//                         itemCount--;
//                       },
//                     ),
//                   ))
//         ],
//       ),
//     );
//   }
// }

// class SomeWidget extends StatelessWidget {
//   final int index;

//   final Function() onPressed;

//   const SomeWidget({Key key, this.index, this.onPressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ListTile(
//             leading: FlatButton(
//           child: Text("item $index"),
//           onPressed: onPressed,
//         )));
//   }
// }

import 'package:currency_converter_app/widgets/edit_currencies/edit_currencies_body.dart';
import 'package:flutter/material.dart';

class EditCurrenciesScreen extends StatelessWidget {
  static const routeName = '/edit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Currencies'),
        backgroundColor: Color(0xff4f5b8d),
      ),
      body: EditCurrenciesBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}
