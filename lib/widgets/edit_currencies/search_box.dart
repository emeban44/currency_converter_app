import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
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
          });
      },
      child: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
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
                      if (value.length > 0 && value.length < 2)
                        setState(() {
                          _removeSearchIcon = true;
                          _showCancelSearchIcon = true;
                        });
                      if (value.isEmpty)
                        setState(() {
                          _removeSearchIcon = false;
                          _showCancelSearchIcon = false;
                        });
                    },
                  ),
                  if (_showCancelSearchIcon)
                    Positioned(
                        right: 0,
                        top: 1,
                        child: IconButton(
                          icon: Icon(
                            Icons.highlight_remove_sharp,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            print('00');
                            _controller.clear();
                            FocusManager.instance.primaryFocus.unfocus();
                            setState(() {
                              _showCancelSearchIcon = false;
                              _isSearching = false;
                              _removeSearchIcon = false;
                            });
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
