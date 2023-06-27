import 'package:flutter/material.dart';

class PasposSearchBar extends StatelessWidget {
  final Function(String)? callbackQuery;
  final Color? cursorColor;
  final String? hintText;

  const PasposSearchBar(
      {Key? key, this.callbackQuery, this.cursorColor, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        cursorColor: cursorColor ?? Colors.indigo,
        style: TextStyle(fontSize: 13.0),
        onChanged: (query) => callbackQuery!(query),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            hintText: hintText ?? 'Search',
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
