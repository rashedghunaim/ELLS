import 'package:flutter/material.dart';
import '../common.dart';

Widget sortBy() {
  List<String> _topRecent = ['Top ', 'Recent'];

  String value;
  return Container(
    child: Row(
      children: [
        rowDivider(
          thikness: 0.80,
          width: 650,
        ),
        SizedBox(width: 5),
        Text(
          'Sort By',
          style: TextStyle(color: Colors.white60),
        ),
        DropdownButton(
          iconEnabledColor: Colors.white,
          underline: Padding(
            padding: EdgeInsets.only(bottom: 6, left: 25),
            child: Text(
              'Top',
              style: TextStyle(color: Colors.white),
            ),
          ),
          value: value,
          onChanged: (newValue) {
            return value = newValue;
          },
          items: _topRecent.map(
            (e) {
              return DropdownMenuItem(
                child: Container(
                  child: Text(e),
                ),
              );
            },
          ).toList(),
        ),
      ],
    ),
  );
}
