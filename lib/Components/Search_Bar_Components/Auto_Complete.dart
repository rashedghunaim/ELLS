import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

class AutoComplete extends StatefulWidget {
  @override
  _AutoCompleteState createState() => _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  var _textAutoCompleteContoller = new TextEditingController();
  List<String> suggestionList = [
    'new way of updating the new system much easier ',
    'hey guys i fount a new way of ..........',
    'flutter ',
    'marketing section ',
    'IT',
  ];
  @override
  Widget build(BuildContext context) {
    return AutoCompleteTextField(
      controller: _textAutoCompleteContoller,
      clearOnSubmit: false,
      suggestions: suggestionList,
      decoration: InputDecoration(
        focusColor: Colors.black,
        fillColor: Colors.amber,
        labelText: 'search',
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      itemFilter: (item, query) {
        return item.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemSubmitted: (item) {
        _textAutoCompleteContoller.text = item;
      },
      itemBuilder: (context, item) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                item,
                style: TextStyle(color: Colors.black26),
              ),
            ],
          ),
        );
      },
      key: null,
    );
  }
}
