import 'package:currency_converter_app/providers/currencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatefulWidget {
  final Function(String text, bool isSearching) searching;
  SearchBox(this.searching);
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  bool _isSearching = false;
  bool _removeSearchIcon = false;
  bool _showCancelSearchIcon = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isSearching == false)
          setState(() {
            _isSearching = true;
            _showCancelSearchIcon = true;
          });
      },
      child: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black38))),
        child: _isSearching
            ? Container(
                padding: const EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                child: Stack(children: [
                  if (!_removeSearchIcon)
                    Positioned(
                        left: 10,
                        top: 5,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Icon(Icons.search, color: Colors.black54))),
                  TextFormField(
                    autofocus: true,
                    autocorrect: false,
                    controller: _controller,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(border: InputBorder.none),
                    onChanged: (value) {
                      if (value.length > 0) {
                        print('Search this ' + value);
                        setState(() {
                          _removeSearchIcon = true;
                          _showCancelSearchIcon = true;
                        });
                        Provider.of<Currencies>(context, listen: false)
                            .search(value);
                        widget.searching(value, true);
                      }
                      // if (value.length > 0 && value.length < 2) {
                      //   if (!_removeSearchIcon)
                      //     setState(() {
                      //       _removeSearchIcon = true;
                      //       _showCancelSearchIcon = true;
                      //     });
                      //   if (_isSearching) widget.searching('/', false);
                      // }
                      if (value.isEmpty) {
                        widget.searching('/', false);
                        setState(() {
                          _removeSearchIcon = false;
                          _showCancelSearchIcon = false;
                        });
                        //   if (_isSearching)

                      }
                    },
                  ),
                  if (_showCancelSearchIcon)
                    Positioned(
                        right: 0,
                        top: 1,
                        child: IconButton(
                          icon: Icon(Icons.highlight_remove_sharp,
                              color: Colors.black54),
                          onPressed: () {
                            final length = _controller.text.length;
                            _controller.clear();
                            FocusManager.instance.primaryFocus.unfocus();
                            setState(() {
                              _showCancelSearchIcon = false;
                              _isSearching = false;
                              _removeSearchIcon = false;
                            });
                            if (length > 1) widget.searching('/', false);
                          },
                        )),
                ]),
              )
            : Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
              ),
      ),
    );
  }
}
