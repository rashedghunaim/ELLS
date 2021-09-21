import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String suffixText;
  final String title;
  final TextEditingController formController;
  final double leftPadding;
  final String helperText;
  final double height;
  final bool activrQerror;

  FormWidget({
    this.formController,
    this.title,
    this.leftPadding,
    this.suffixText,
    this.helperText,
    this.height,
    this.activrQerror,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextField(
        readOnly: true,
        enabled: true,
        controller: formController,
        decoration: InputDecoration(
          helperText: helperText,
          hintStyle: TextStyle(fontSize: 13),
          suffixStyle: TextStyle(fontSize: 11),
          suffixText: suffixText,
          hintText: title,
          filled: true,
          labelStyle: TextStyle(fontSize: 10),
          contentPadding: EdgeInsets.only(left: leftPadding, right: 12),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
