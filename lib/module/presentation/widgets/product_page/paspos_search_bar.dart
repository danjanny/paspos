import 'package:flutter/material.dart';

class PasposSearchBar extends StatefulWidget {
  final Function(String)? callbackQuery;
  final Color? cursorColor;
  final String? hintText;

  const PasposSearchBar(
      {Key? key, this.callbackQuery, this.cursorColor, this.hintText})
      : super(key: key);

  @override
  State<PasposSearchBar> createState() => _PasposSearchBarState();
}

class _PasposSearchBarState extends State<PasposSearchBar> {
  final TextEditingController _controller = TextEditingController();

  bool _onChanged = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        cursorColor: widget.cursorColor ?? Colors.indigo,
        style: TextStyle(fontSize: 13.0),
        onChanged: (query) {
          // check text is not empty
          if (_controller.text.isNotEmpty) {
            setState(() {
              _onChanged = true;
            });
          } else {
            setState(() {
              _onChanged = false;
            });
          }

          widget.callbackQuery!(query);
        },
        decoration: InputDecoration(
            suffixIcon: IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  setState(() {
                    _onChanged = false;
                  });
                  _controller.clear();
                },
                icon: _onChanged ? Icon(Icons.clear, size: 16.0) : Container()),
            filled: true,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            hintText: widget.hintText ?? 'Search',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Color(0xFFEBEBEB)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Color(0xFFEBEBEB)),
            ),
            hintStyle: TextStyle(fontSize: 12.0)),
      ),
    );
  }
}
