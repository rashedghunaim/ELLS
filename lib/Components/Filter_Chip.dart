import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterChipWidget extends StatefulWidget {
  final String shipName;

  FilterChipWidget({this.shipName});

  @override
  _FilterChipState createState() => _FilterChipState();
}

class _FilterChipState extends State<FilterChipWidget> {
  bool _isSelected = false;

  void check() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (_isSelected) {
      preferences.setString("check", _isSelected.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: FilterChip(
        
        labelPadding: EdgeInsets.only(left: 10, right: 10),
        backgroundColor: Colors.grey[200],
        label: Container(
            width: double.infinity,
            child: Text(
              widget.shipName,
              textAlign: TextAlign.center,
            ),),
        selected: _isSelected,
        onSelected: (selected) {
          setState(() {
            _isSelected = selected;
          });
        },
        padding: EdgeInsets.only(left: 10, right: 10),
        selectedColor: Colors.blue,
      ),
    );
  }
}
